import 'package:example1/database_helper/database_helper.dart';
import 'package:example1/models/cart_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:example1/database_helper/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class PageWithAnimatedList extends StatefulWidget {
  @override
  _PageWithAnimatedListState createState() => _PageWithAnimatedListState();
}

class _PageWithAnimatedListState extends State<PageWithAnimatedList> {
  // var _listItems = <Widget>[];
  // final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  List<CartModel> todoList;
  int count = 0;

  Future<List<CartModel>> dogs() async {
    Database db = await DatabaseHelper.instance.database;
    // Get a reference to the database.

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('my_table');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return CartModel(
        maps[i]['name'],
        maps[i]['sum'],
        maps[i]['count'],
        maps[i]['image']
      );
    });
  }

  @override
  void initState() {
    super.initState();
    Future<List<CartModel>> as = dogs();
    as.then((todoList) {
      setState(() {
        this.todoList = todoList;
        this.count = todoList.length;
      });
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      
      ),
      body: ListView.builder(
        itemCount: count,
          itemBuilder: (context, index){
          final item = todoList[index];
          return ListTile(
            leading: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 44,
                minHeight: 44,
                maxWidth: 64,
                maxHeight: 64,
              ),
              child: Image.network(item.image.toString(), fit: BoxFit.cover),
            ),
            title: Text(item.name.toString()),
            subtitle: Text(item.count.toString()),
          );
          }

      )
    );
  }
}
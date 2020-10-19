import 'package:example1/const/static_values.dart';
import 'package:example1/database_helper/database_helper.dart';
import 'package:example1/details/component/color_and_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:io' as Io;
import 'dart:convert';
import 'package:example1/const/constant.dart';
import 'package:sqflite/sqflite.dart';


class AddtoCart extends StatefulWidget {
   String name;
   double sum;
   String image;

   AddtoCart(this.sum, this.name, this.image);

  @override
  _AddtoCartState createState() => _AddtoCartState();
}

class _AddtoCartState extends State<AddtoCart> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white),
            ),
            child: IconButton(icon: SvgPicture.asset('assets/icons/add_to_cart.svg', color: Colors.red),
                onPressed: (){

                }),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)
                  ),
                  color: Colors.blue,
                  onPressed: (){
                    _insert();
                    Scaffold.of(context).showSnackBar(new SnackBar(
                      content: new Text('Xarid qildingiz!'),
                    ));                                            //       MyStaticValues.myObjectList.add(new CartModel(name, sum.toStringAsFixed(3), MyStaticValues.count, MyStaticValues.size, image));
                    },
                  child: Text('Xarid'.toUpperCase(), style: TextStyle(fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow))),
            ),
          ),
        ],
      ),
    );
  }

  _insert() async {
    // final ab = Io.File(widget.image).readAsBytesSync();
    // String img64 = base64Encode(ab);
    // print('salom '+ img64.substring(0, 100));
    // get a reference to the database
    // because this is an expensive operation we use async and await
    Database db = await DatabaseHelper.instance.database;

    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName : widget.name,
      DatabaseHelper.columnCount  : MyStaticValues.count,
      DatabaseHelper.columnSum : widget.sum,
      DatabaseHelper.columnImage : widget.image
    };

    // do the insert and get the id of the inserted row
    int id = await db.insert(DatabaseHelper.table, row);


  }

}
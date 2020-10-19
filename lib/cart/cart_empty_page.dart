import 'package:flutter/material.dart';

class CartEmpty extends StatefulWidget {
  @override
  _CartEmptyState createState() => _CartEmptyState();
}

class _CartEmptyState extends State<CartEmpty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(icon: Icon(Icons.add, color: Colors.white,)),
            //  IconButton(icon: Icon(Icons.remove), onPressed: _unloadItems)
            IconButton(icon: Icon(Icons.remove, color: Colors.white,)),
          ],
        ),
        body:Center(
          child: Text('Empty')
        )


    );
  }
}

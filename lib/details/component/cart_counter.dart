import 'package:flutter/material.dart';
import 'package:example1/const/constant.dart';
import 'package:example1/const/static_values.dart';

import 'body.dart';

class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            if (numOfItems > 1) {
              setState(() {
                numOfItems--;
                MyStaticValues.count = numOfItems;
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Text(numOfItems.toString().padLeft(2, "0"),
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6),
        ),
        buildOutlineButton(icon: Icons.add, press: () {
          setState(() {
            if(MyStaticValues.valueablity > numOfItems) {
              numOfItems++;
              MyStaticValues.count = numOfItems;
              print('hop ' + MyStaticValues.count.toString());
            }
          });
        }),
      ],
    );
  }
}
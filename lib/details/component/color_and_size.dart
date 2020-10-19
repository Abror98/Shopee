import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:example1/const/constant.dart';
import 'package:example1/const/static_values.dart';
import 'package:example1/models/cart_models.dart';

import 'body.dart';

class ColorandSize extends StatefulWidget {
  int availability;

  ColorandSize(this.availability);

  @override
  _ColorandSizeState createState() => _ColorandSizeState();
}

class _ColorandSizeState extends State<ColorandSize> {
  bool _value1 = true;
  bool _value2 = false;
  bool _value3 = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Center(
                child: Column(
                  children: [
                    xLItem(),
                    SizedBox(height: kDefaultPaddin/4,),
                    xxLItem(),
                    SizedBox(height: kDefaultPaddin/4,),
                    xxxLItem(),
                  ],
                ),
              ),
          RichText(
            textAlign: TextAlign.right,
            text: TextSpan(
                style: TextStyle(color: kTextColor),
                children: [
                  TextSpan(
                      text: "Mavjud:\n"
                  ),
                  TextSpan(
                    text: widget.availability.toString(),
                    style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold),
                  )
                ]
            ),
          ),


        ],


      ),
    );
  }

  Row xLItem() {
    return Row(
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          setState(() {
                            if(_value2!= true && _value3 != true)
                            _value1 = !_value1;
                            MyStaticValues.size = 'XL';
                          });
                        },
                        child: Container(
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _value1
                              ? Icon(
                            Icons.check,
                            size: 15.0,
                            color: Colors.white,
                          )
                              : Icon(
                            Icons.check_box_outline_blank,
                            size: 15.0,
                            color: Colors.blue,
                          ),
                        ),
                    ),
                      ),
                    SizedBox(width: kDefaultPaddin / 2),
                    Text('XL    ', style: TextStyle(fontWeight: FontWeight.bold)),
                   ],

                  );
  }

Row xxLItem() {
  return Row(
    children: <Widget>[

      InkWell(
        onTap: (){
          setState(() {
            if(_value1!= true && _value3 != true)
              _value2 = !_value2;
            MyStaticValues.size = 'XXL';
          });
        },
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _value2
                ? Icon(
              Icons.check,
              size: 15.0,
              color: Colors.white,
            )
                : Icon(
              Icons.check_box_outline_blank,
              size: 15.0,
              color: Colors.blue,
            ),
          ),
        ),
      ),
      SizedBox(width: kDefaultPaddin / 2),
      Text('XXL  ', style: TextStyle(fontWeight: FontWeight.bold)),
    ],

  );
}

Row xxxLItem() {
  return Row(
    children: <Widget>[
      InkWell(
        onTap: (){
          setState(() {
            if(_value1!= true && _value2 != true)
              _value3 = !_value3;
            MyStaticValues.size = 'XXXL';
          });
        },
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _value3
                ? Icon(
              Icons.check,
              size: 15.0,
              color: Colors.white,
            )
                : Icon(
              Icons.check_box_outline_blank,
              size: 15.0,
              color: Colors.blue,
            ),
          ),
        ),
      ),
      SizedBox(width: kDefaultPaddin / 2),
      Text('XXXL', style: TextStyle(fontWeight: FontWeight.bold)),
    ],

  );
}
}
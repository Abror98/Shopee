import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:example1/const/constant.dart';
import 'package:example1/details/component/product_title_with_image.dart';

import 'add_to_cart.dart';
import 'color_and_size.dart';
import 'counter_with_fav_btn.dart';
import 'description.dart';

class Body extends StatelessWidget{
  double sum;
  String name;
  int availability;
  String image;
  List<dynamic>ab;


  Body(this.ab, this.sum, this.name, this.availability, this.image);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
         return SingleChildScrollView(
           child: Column(
             children: <Widget>[
               SizedBox(
                 height: size.height,
                 child: Stack(
                   children: <Widget>[
                     Container(
                       margin: EdgeInsets.only(top: size.height * 0.3),
                       padding: EdgeInsets.only(
                         top: size.height * 0.12,
                         left: kDefaultPaddin,
                         right: kDefaultPaddin,

                       ),
                       height: 500,
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.only(
                           topLeft: Radius.circular(24),
                           topRight: Radius.circular(24),
                         )
                       ),
                       child: Column(
                         children: <Widget>[
                           ColorandSize(availability),
                           SizedBox(height: kDefaultPaddin / 2),
                           Desciption(),
                           SizedBox(height: kDefaultPaddin/2),
                           CounterWithFavBtn(),
                           SizedBox(height: kDefaultPaddin /2),
                           AddtoCart(sum, name, image),
                         ],
                       ),
                     ),
                     ProductTitlwWithImage(ab, sum, name, availability, image),
                   ],
                 ),
               )
             ],
           ),
         );
  }
}






class ColorDot extends StatelessWidget {
  final Color color;
  final isSelected;


  const ColorDot({
    Key key, this.color, this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: kDefaultPaddin / 4,
        right: kDefaultPaddin / 2,
      ),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        )
      ),
      child: DecoratedBox(
        decoration:
        BoxDecoration(color: color,shape: BoxShape.circle,
        ),

      ),
    );
  }
}


  SizedBox buildOutlineButton({IconData icon, Function press}) {
    return SizedBox(
        width: 40,
        height: 32,
        child: OutlineButton(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          onPressed: press,
          child: Icon(icon),
        ),
      );
  }



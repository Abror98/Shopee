

import 'package:example1/cart/cart_empty_page.dart';
import 'package:example1/const/static_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:example1/cart/cart_page.dart';
import 'package:example1/const/constant.dart';
import 'package:example1/details/component/body.dart';
import 'package:example1/const/static_values.dart';

class DetailScreen extends StatefulWidget{
  List<dynamic>ab;
  double sum;
  String name;
  int availability;
  String image;




  DetailScreen(this.ab, this.sum,
      this.name, this.availability, this.image);


  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>{

  @override
  void initState() {
    super.initState();



    MyStaticValues.valueablity = widget.availability;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(int.parse(widget.ab[0]), int.parse(widget.ab[1]), int.parse(widget.ab[2]), 1),
      appBar: buildAppBar(context),
      body: Body(widget.ab, widget.sum, widget.name, widget.availability, widget.image),
    );

  }

  AppBar buildAppBar(BuildContext context) {
    if(int.parse(widget.ab[0]) == 255 && int.parse(widget.ab[1]) == 255 && int.parse(widget.ab[2]) == 255)
    return AppBar(
      backgroundColor: Color.fromRGBO(int.parse(widget.ab[0]), int.parse(widget.ab[0]), int.parse(widget.ab[0]), 1),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/back.svg',
            color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(icon: SvgPicture.asset('assets/icons/search.svg', color: Colors.black,), onPressed: (){
          print('if ' + widget.ab[0].toString() + ' ' +  widget.ab[1].toString() + ' ' + widget.ab[2].toString());
        }),
        IconButton(icon: SvgPicture.asset('assets/icons/cart.svg', color: Colors.black,), onPressed: (){
          if(MyStaticValues.count > 0)
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => (PageWithAnimatedList())));
          else  Navigator.push(context,
              MaterialPageRoute(builder: (context) => (CartEmpty())));
        }),
        SizedBox(width: kDefaultPaddin / 2,)
      ],
    );
   else
      return AppBar(
        backgroundColor:  Color.fromRGBO(int.parse(widget.ab[0]), int.parse(widget.ab[1]), int.parse(widget.ab[2]), 1),
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/back.svg',
              color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(icon: SvgPicture.asset('assets/icons/search.svg'), onPressed: (){
            print('else ' + widget.ab[0].toString() + ' ' +  widget.ab[1].toString() + ' ' + widget.ab[2].toString());
          }),
          IconButton(icon: SvgPicture.asset('assets/icons/cart.svg'), onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PageWithAnimatedList()));
          }),
          SizedBox(width: kDefaultPaddin / 2,)
        ],
      );
  }





}


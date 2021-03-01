import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:example1/const/constant.dart';
import 'package:example1/models/clothes_model.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:example1/details/detail_screen.dart';

import '../models/clothes_model.dart';

class ClothesList extends StatefulWidget {
  final List<Clothes> photos;

  int count;

  ClothesList({Key key, this.photos, this.count}) : super(key: key);

  @override
  _ClothesListState createState() => _ClothesListState();
}

class _ClothesListState extends State<ClothesList> {
  List<dynamic> parseColor(String a){
   List list = a.split(',');
   print("daol" + widget.count.toString());
   return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: kDefaultPaddin,
            crossAxisSpacing: kDefaultPaddin,
            childAspectRatio: 0.75,
          ),
          itemCount: widget.count,
          itemBuilder: (context, index) {
          List <dynamic> ab =  parseColor(widget.photos[index].color);
          return GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailScreen(ab, widget.photos[index].sum, widget.photos[index].name, widget.photos[index].availability, widget.photos[index].image),
                    ));
              },
              child: Column(
                children:<Widget> [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(kDefaultPaddin),
                      height: 160,
                      width: 140,
                      decoration: BoxDecoration(
                        color:Color.fromRGBO(int.parse(ab[0]), int.parse(ab[1]), int.parse(ab[2]), 1),
                          borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image.network(widget.photos[index].image),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
                    child: SizedBox(
                      width: double.infinity,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              widget.photos[index].name,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "${widget.photos[index].sum.toStringAsFixed(3)}" ,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  )
                ],
              ),
            );


              //
          },
        ),
      ),
    );
  }
}
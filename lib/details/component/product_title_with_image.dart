import 'package:flutter/material.dart';
import 'package:example1/const/constant.dart';


class ProductTitlwWithImage extends StatelessWidget {
  double sum;
  String name;
  int availability;
  String image;
  List<dynamic>ab;





  ProductTitlwWithImage(this.ab,
      this.sum, this.name, this.availability, this.image);

  @override
  Widget build(BuildContext context) {
    if (int.parse(ab[0]) == 255 && int.parse(ab[1]) == 255 &&
        int.parse(ab[2]) == 255) {
      return base(context, Colors.black);
    }
    else{
      return base(context, Colors.white);
    }
  }

  Padding base(BuildContext context, a) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(name, style: Theme
              .of(context)
              .textTheme
              .headline6
              .copyWith(
              color: a, fontWeight: FontWeight.bold)),
          SizedBox(height: kDefaultPaddin),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'Narx\n', style: Theme
                    .of(context)
                    .textTheme
                    .headline6
                    .copyWith(
                    color: a)),
                    TextSpan(text: sum.toStringAsFixed(3) + ' sum',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline6
                          .copyWith(
                          color: a, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Hero(
                  tag: 'product id',
                  child: InkWell(
                    onTap: () {
                    },
                    child: Image.network(image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
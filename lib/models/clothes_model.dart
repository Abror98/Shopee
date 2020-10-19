

import 'package:flutter/cupertino.dart';

class Clothes {
  final String name;
  final String manufacturer;
  final String productCode;
  final double sum;
  final String priceInclude;
  final int availability;
  final String image;
  final String color;


  Clothes({this.name, this.manufacturer, this.productCode, this.sum,
      this.priceInclude, this.availability, this.image, this.color});

  factory Clothes.fromJson(Map<String, dynamic> json) {
    return Clothes(
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      productCode: json['productCode'] as String,
      sum: json['sum'] as double,
      priceInclude: json['priceInclude'] as String,
      availability: json['availability'] as int,
      image: json['image'] as String,
      color: json['color'] as String
    );
  }
}
import 'package:flutter/material.dart';
import 'package:example1/const/constant.dart';

class Desciption extends StatelessWidget {
  const Desciption({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text('Info', style: TextStyle(height: 1.5)),
    );
  }
}

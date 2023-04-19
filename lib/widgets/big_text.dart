import 'package:flutter/material.dart';



class BigText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;

  double size;

  BigText({required this.text,required this.size, required this.color,required this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}

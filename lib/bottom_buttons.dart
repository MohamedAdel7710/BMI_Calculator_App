import 'package:flutter/material.dart';
import 'constant.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.text});
  final String text;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        )),
        color: bottomContainerColor,
        width: double.infinity,
        height: bottomContainerHeight,
        margin: EdgeInsets.only(top: 10.0),
      ),
    );
  }
}
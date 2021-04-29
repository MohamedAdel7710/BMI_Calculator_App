import 'package:flutter/material.dart';

class ContainerBox extends StatelessWidget {
  ContainerBox({@required this.colour, this.cardChild, this.myOnPress});
  final Color colour;
  final Widget cardChild;
  final Function myOnPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: myOnPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}

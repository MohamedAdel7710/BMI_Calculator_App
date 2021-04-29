import 'package:flutter/material.dart';
import 'constant.dart';

class GenderContainer extends StatelessWidget {
  GenderContainer({@required this.gender, @required this.gendername});

  final IconData gender;
  final String gendername;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          gender,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gendername,
          style: labelTextStyle,
        )
      ],
    );
  }
}

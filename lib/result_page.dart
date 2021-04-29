import 'package:flutter/material.dart';
import 'constant.dart';
import 'container_box.dart';
import 'bottom_buttons.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiNum,@required this.interpretation,@required this.resu});

  final String resu;
  final String bmiNum;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomCenter,
              child: Text(
                'Your Result',
                style: KTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: ContainerBox(
              colour: activeBoxColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(resu, style: KResultTextStyle),
                  Text(bmiNum, style: KBMITextStyle),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      interpretation,
                      style: KBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomButton(onTap: (){
            Navigator.pop(context);
          }, text: 'RE-CALCULATE')
        ],
      ),
    );
  }
}

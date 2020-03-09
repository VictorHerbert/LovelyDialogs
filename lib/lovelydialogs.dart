library lovelydialogs;

//lieno tecnologia

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class _LovelyDialog extends StatelessWidget{
    
}

class LovelyDialogInfo extends _LovelyDialog{

  BuildContext context;
  LovelyDialogInfo(BuildContext this.context);

  show(){
    return showDialog(
      context: context,
      builder: (BuildContext context) => this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
        Container(
          height: 200,
        ),
        Row(
          children: <Widget>[
            
          ],
        )

      ],
    );
  }
   

}

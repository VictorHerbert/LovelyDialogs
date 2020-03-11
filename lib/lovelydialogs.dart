library lovelydialogs;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class _LovelyDialog extends StatelessWidget {
  final String title;
  final Function onConfirm;
  final Function onCancel;

  final Color color;
  final Radius borderRadius;

  _LovelyDialog({
    this.title = 'Title',
    this.onConfirm,
    this.onCancel,
    this.color = Colors.blue,
    this.borderRadius = const Radius.circular(5),
  });

  Widget baseDialog(Widget content) {
    return Dialog(
      shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.all(borderRadius)),
      child: IntrinsicHeight(
        child: Column(
          children: <Widget>[
            Container(
              height: 90,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      topLeft: borderRadius, topRight: borderRadius)),
              child: Icon(
                Icons.pets,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  content,
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
                            child: Text('Cancel'),
                            onPressed: onConfirm,
                          ),
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: onConfirm,
                          )
                        ]),
                  )
                ],
              ),
            )
          ],
          //),
        ),
      ),
    );
  }
}

class LovelyDialogInfo extends _LovelyDialog {
  final BuildContext context;

  LovelyDialogInfo(BuildContext this.context,
      {String title = 'LovelyDialogs', Function onConfirm, Function onCancel})
      : super(title: title, onConfirm: onConfirm, onCancel: onCancel);

  show() {
    return showDialog(
      context: context,
      builder: (BuildContext context) => this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return baseDialog(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'orem ipsum dolor sit amet, pat. Vivamus dui est, fin sisagittis tortor dui. Mo',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
            //fontWeight: FontWeight.bold
          ),
        ),
        Row(
          children: <Widget>[
            InkWell(
              child: Icon(Icons.check_box_outline_blank),
              onTap: () => print('tap'),
            ),
            
            Text(
              'Don\'t show again',
              style: TextStyle(
                  //color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    ));
  }
}

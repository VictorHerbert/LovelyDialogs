library lovelydialogs;

//lieno tecnologia
//git -c "user.name=Vector" -c "user.email=victorherberts@outlook.com" commit -m ""


//tar xvf flutter_linux_v1.9.1+hotfix.2-stable.tar.xz
//sudo mv flutter/ /usr/lib

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class _LovelyDialog extends StatelessWidget{

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
    this.borderRadius = const Radius.circular(10),
    });

  Widget baseDialog (Widget content) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(borderRadius)
      ),
      child: Container(
        height: 300,
        child: Padding(
          padding: EdgeInsets.only(left: 16,right: 16, top: 16, bottom: 16),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 90,
              width: double.maxFinite,            
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
              ),
              child: Icon(Icons.pets,color: Colors.white,),
            ),
            
              child: Text(
                'Title',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            content,
            Row(
              children: <Widget>[
                FlatButton(
                  child: Text('ok'),
                  onPressed: onConfirm,
                )
              ],
            )
          ],
        ),
        )
        
      ),
    );
  }
    
}

class LovelyDialogInfo extends _LovelyDialog{

  final BuildContext context;

  LovelyDialogInfo(
    BuildContext this.context,
    {String mTitle, Function mOnConfirm,
    Function mOnCancel}
  ):
  super(
    title: mTitle, onConfirm: mOnConfirm, onCancel: mOnCancel
  );

  show(){
    return showDialog(
      context: context,
      builder: (BuildContext context) => this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return baseDialog(Text('pera'));
  }
   

}

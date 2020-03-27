library lovelydialogs;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class _LovelyDialog extends StatelessWidget {
  final BuildContext context;
	final String title;
	final Color color;
	final Icon icon;

  final Radius borderRadius;
	final ButtonTextTheme buttonsTextTheme;

  _LovelyDialog({
		@required this.context,
		this.title = '',
		this.color = Colors.blue,
		this.icon = const Icon(Icons.info),

		this.borderRadius = const Radius.circular(5),	
		this.buttonsTextTheme = ButtonTextTheme.accent,
	});

  Widget baseDialog(Widget content) {
    return Dialog(
			elevation: 0,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(borderRadius)),
      child: IntrinsicHeight(
        child: Column(
          children: <Widget>[
            Container(
              height: 90,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(topLeft: borderRadius, topRight: borderRadius)),
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
                ],
              ),
            )
          ],
          //),
        ),
      ),
    );
  }

	show() {
    return showDialog(
      context: context,
      builder: (BuildContext context) => this,
    );
  }

}

class LovelyInfoDialog extends _LovelyDialog {
	final String preferenceID;
	final Function onConfirm;
	final String description;

  LovelyInfoDialog({
    @required BuildContext context,
		Color color = Colors.blue,
		Icon icon = const Icon(Icons.info),
		String title = '',

		@required this.description,
		this.preferenceID = '',
    this.onConfirm,    
  }) : super(
		context: context,
		color: color,
		icon: icon,
		title: title
	);


  @override
  Widget build(BuildContext context) {
    return baseDialog(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          description,
          style: TextStyle(color: Colors.grey,fontSize: 14,),
        ),
        SizedBox(
          height: 16,
        ),
        (preferenceID == '')? SizedBox(height: 0,) : Row(
          children: <Widget>[
            Checkbox(
              value: true,
              onChanged: (_) {},
            ),
            Text(
              'Don\'t show again',
              style: TextStyle(								
								fontSize: 14,
								fontWeight: FontWeight.bold
							),
            ),
						Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
														textTheme: buttonsTextTheme,
                            onPressed: () => onConfirm(),
                            child: Text(
                              "Confirm",
                              //style: TextStyle(fontSize: 20.0),
                            ),
                          )
                        ]),
                  )
          ],
        ),
      ],
    ));
  }
}


class LovelyChoiceDialog extends _LovelyDialog {
	final Function onConfirm;
	final Function onCancel;

	LovelyChoiceDialog({
    @required BuildContext context,
		Color color = Colors.blue,
		Icon icon = const Icon(Icons.info),
		String title = '',

    this.onConfirm,
		this.onCancel,
  }) : super(
		context: context,
		color: color,
		icon: icon,
		title: title
	);

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
        SizedBox(
          height: 16,
        ),
        Row(
          children: <Widget>[
            Checkbox(
              value: true,
              onChanged: (_) {},
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

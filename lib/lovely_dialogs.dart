library lovelydialogs;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

part 'package:lovelydialogs/lovely_info_dialog.dart';
part 'package:lovelydialogs/lovely_choice_dialog.dart';
part 'package:lovelydialogs/lovely_text_input_dialog.dart';


//[LovelyInfo] StatefullWidget 

abstract class LovelyDialog extends StatelessWidget {
  final BuildContext context;
	final String title;
	final Color color;
	final Gradient gradient;
	final Widget leading;

  final Radius borderRadius;
	final ButtonTextTheme buttonsTextTheme;

  LovelyDialog({
		@required this.context,
		this.title = '',
		this.color = Colors.blue,
		this.gradient,
		this.leading = const Icon(Icons.info),

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
								color: color,
								gradient: gradient,
								borderRadius: BorderRadius.only(topLeft: borderRadius, topRight: borderRadius)),
              child: leading,
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
                      fontSize: 18,
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
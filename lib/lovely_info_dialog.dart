part of lovelydialogs;

class LovelyInfoDialog extends LovelyDialog {
  final Function() onConfirm;
  final String description;
  final String confirmString;

  LovelyInfoDialog({
    @required BuildContext context,
    String title,
    Color color = Colors.blue,
    Gradient gradient,
		double landscapeWidth,
    Widget leading = const Icon(Icons.info, color: Colors.white),
    Radius borderRadius = const Radius.circular(5),
    ButtonTextTheme buttonsTextTheme,
    bool touchDismissible = true,
    bool backDismissible = true,
    @required this.description,
    this.confirmString = 'Confirm',
    this.onConfirm,
  }) : super(
          context: context,
          title: title,
          color: color,
          gradient: gradient,
					landscapeWidth: landscapeWidth,
          leading: leading,
          borderRadius: borderRadius,
          buttonsTextTheme: buttonsTextTheme,
          touchDismissible: touchDismissible,
          backDismissible: backDismissible,
        );

  @override
  Widget build(BuildContext context) {
    return baseDialog(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          description,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        (onConfirm == null)
            ? SizedBox(
                height: 0,
              )
            : Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        textTheme: buttonsTextTheme,
                        onPressed: () {
                          Navigator.of(context).pop();
                          onConfirm();
                        },
                        child: Text(confirmString),
                      )
                    ]),
              )
      ],
    ));
  }
}

part of lovelydialogs;

class LovelyInfoDialog extends LovelyDialog {
  final Function() onConfirm;
  final String description;
	final String confirmString;

  LovelyInfoDialog({
    @required BuildContext context,
    Color color = Colors.blue,
		Gradient gradient,
    Widget leading = const Icon(Icons.info, color: Colors.white),
    String title,

    @required this.description,
		this.confirmString,
    this.onConfirm,
  }) : super(context: context, color: color, gradient: gradient, leading: leading, title: title);

  @override
  Widget build(BuildContext context) {
    return baseDialog(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          description,
          style: TextStyle(color: Colors.grey,fontSize: 14,),
        ),
        SizedBox(height: 16,),
				(onConfirm == null)
					? SizedBox(height: 0,)
					: Align(
						alignment: Alignment.bottomCenter,
						child:Row(
							mainAxisAlignment: MainAxisAlignment.end,
								children: <Widget>[
								FlatButton(
									textTheme: buttonsTextTheme,
									onPressed: (){
										Navigator.of(context).pop();
										onConfirm();
									},
									child: Text(confirmString),
								)
							]
						),
					)
      	],
    	));
  }
}

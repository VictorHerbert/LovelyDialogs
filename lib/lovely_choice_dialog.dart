part of lovelydialogs;

class LovelyChoiceDialog extends LovelyDialog {
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

//LovelyChoiceDialogState extends State<>{}

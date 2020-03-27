part of lovelydialogs;

class LovelyTextInputDialog extends LovelyDialog {
	final Function onConfirm;
	final Function onCancel;

	LovelyTextInputDialog({
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
    return baseDialog(LovelyTextInputContent());
  }
}

class LovelyTextInputContent extends StatefulWidget{

  @override
  _LovelyTextInputState createState() => _LovelyTextInputState();

}

class _LovelyTextInputState extends State<LovelyTextInputContent>{

  @override
  Widget build(BuildContext context) {
		return Column(
			children: <Widget>[
				TextField(
					decoration: InputDecoration(
						border: InputBorder.none,
						icon: Icon(Icons.comment),
						hintText: 'Comentários',
					),
				//	onChanged: (text) => bloc.comment = text,
				),
			]
		);
	}
}

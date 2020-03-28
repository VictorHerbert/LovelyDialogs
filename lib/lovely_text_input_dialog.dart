part of lovelydialogs;

class LovelyTextInputDialog extends LovelyDialog {
  final Function onConfirm;
  final Function onCancel;
	//TODO icon hint

  LovelyTextInputDialog({
    @required BuildContext context,
    Color color = Colors.green,
    Widget leading = const Icon(Icons.comment, color: Colors.white),
    String title = '',
		
    this.onConfirm,
    this.onCancel,
  }) : super(context: context, color: color, leading: leading, title: title);

  @override
  Widget build(BuildContext context) {
    return baseDialog(LovelyTextInputContent());
  }
}

class LovelyTextInputContent extends StatefulWidget {
  @override
  _LovelyTextInputState createState() => _LovelyTextInputState();
}

class _LovelyTextInputState extends State<LovelyTextInputContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Column(children: <Widget>[
        TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            icon: Icon(Icons.comment),
            hintText: 'Comentários',
          ),
          //	onChanged: (text) => bloc.comment = text,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            FlatButton(
              //textTheme: buttonsTextTheme,
              onPressed: () {
                Navigator.of(context).pop();
                //onConfirm();
              },
              child: Text(
                "Confirm",
                //style: TextStyle(fontSize: 20.0),
              ),
            )
          ]),
        )
      ]),
    );
  }
}

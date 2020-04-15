part of lovelydialogs;

class LovelyTextInputDialog extends LovelyDialog {
  final Function(String) onConfirm;
  final Function(String) onChange;
  final Icon hintIcon;
  final String hintText;
  final String confirmString;

  LovelyTextInputDialog({
    @required BuildContext context,
    String title,
    Color color = Colors.green,
    Gradient gradient,
    Widget leading = const Icon(Icons.comment, color: Colors.white),
    Radius borderRadius,
    ButtonTextTheme buttonsTextTheme,
    bool touchDismissible,
    bool backDismissible,
    this.hintIcon,
    this.hintText,
    this.confirmString = 'Confirm',
    this.onConfirm,
    this.onChange,
  }) : super(
          context: context,
          title: title,
          color: color,
          gradient: gradient,
          leading: leading,
          borderRadius: borderRadius,
          buttonsTextTheme: buttonsTextTheme,
          touchDismissible: touchDismissible,
          backDismissible: backDismissible,
        );

  @override
  Widget build(BuildContext context) => baseDialog(LovelyTextInputContent(
      onConfirm,
      onChange,
      hintIcon,
      hintText,
      confirmString,
      buttonsTextTheme));
}

class LovelyTextInputContent extends StatefulWidget {
  final Function(String) _onConfirm;
  final Function(String) _onChanged;
  final Icon _hintIcon;
  final String _hintText;
  final String _confirmString;
  final ButtonTextTheme _buttonTextTheme;

  LovelyTextInputContent(this._onConfirm, this._onChanged, this._hintIcon,
      this._hintText, this._confirmString, this._buttonTextTheme);

  @override
  _LovelyTextInputState createState() => _LovelyTextInputState();
}

class _LovelyTextInputState extends State<LovelyTextInputContent> {
  String _text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Column(children: <Widget>[
        TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            icon: widget._hintIcon,
            hintText: widget._hintText,
          ),
          onChanged: (value) {
            widget._onChanged(value);
            _text = value;
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            FlatButton(
              textTheme: widget._buttonTextTheme,
              onPressed: () {
                Navigator.of(context).pop();
                widget._onConfirm(_text);
              },
              child: Text(
                widget._confirmString,
              ),
            )
          ]),
        )
      ]),
    );
  }
}

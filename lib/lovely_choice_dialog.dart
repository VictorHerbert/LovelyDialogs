part of lovelydialogs;

class LovelyChoiceDialog extends LovelyDialog {
  final Function(bool, int) onValueChanged;
  final Function(List<bool>) onConfirm;

  final List<String> stringList;
  final Color activeCheckColor;
  final String confirmString;
	final double optionsFieldHeight;

  LovelyChoiceDialog({
    @required BuildContext context,
    String title,
    Color color = Colors.red,
    Gradient gradient,
		double landscapeWidth,
    Widget leading = const Icon(Icons.list, color: Colors.white),
    Radius borderRadius = const Radius.circular(5),
    ButtonTextTheme buttonsTextTheme,
    bool touchDismissible = true,
    bool backDismissible = true,
    this.stringList,
    this.activeCheckColor,
    this.confirmString = 'Confirm',
		this.optionsFieldHeight,
    @required this.onConfirm,
    this.onValueChanged,
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
    return baseDialog(LovelyChoiceContent(buttonsTextTheme, stringList,
        confirmString, activeCheckColor, onConfirm, onValueChanged,optionsFieldHeight));
  }
}

class LovelyChoiceContent extends StatefulWidget {
  final ButtonTextTheme _buttonsTextTheme;
  final List<String> _stringList;
  final Color _activeCheckColor;
  final Function(List<bool>) _onConfirm;
  final Function(bool, int) _onValueChanged;
  final String _confirmString;
	final double _optionsFieldHeight;

  LovelyChoiceContent(
      this._buttonsTextTheme,
      this._stringList,
      this._confirmString,
      this._activeCheckColor,
      this._onConfirm,
      this._onValueChanged,
			this._optionsFieldHeight);

  @override
  _LovelyChoiceState createState() => _LovelyChoiceState();
}

class _LovelyChoiceState extends State<LovelyChoiceContent> {
  List<bool> checked = List.filled(20, false);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Container(//60 .3
          height: //widget._chooseFieldHeight ??
						min(widget._stringList.length * 53.0,
								widget._optionsFieldHeight ?? MediaQuery.of(context).size.height * .5),
          child: ListView.builder(
              itemCount: widget._stringList.length,
              itemBuilder: (_, index) {
                return ListTile(
                  contentPadding: EdgeInsets.only(right: 0),
                  title: Text(
                    widget._stringList[index],
                  ),
                  subtitle: null,
                  trailing: Checkbox(
                    activeColor: widget._activeCheckColor,
                    value: checked[index],
                    onChanged: (value) {
                      if (widget._onValueChanged != null)
                        widget._onValueChanged(value, index);
                      setState(() {
                        checked[index] = !checked[index];
                      });
                    },
                  ),
                );
              }),
        ),
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            FlatButton(
              textTheme: widget._buttonsTextTheme,
              onPressed: () {
                widget._onConfirm(checked);
                Navigator.of(context).pop();
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

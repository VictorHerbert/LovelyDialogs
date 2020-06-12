part of lovelydialogs;

class LovelyProgressSingleton {
  static Function(double) _callback;
  static set callback(func) {
    _callback = func;
  }

  static void setValue(double value) {
    if (_callback != null) _callback(value);
  }

  static bool hasDialogActive() => (_callback != null);
}

enum LovelyProgressType { Linear, Circular }

class LovelyProgressDialog extends LovelyDialog {
  final LovelyProgressType type;
	final Function onFinish;

  LovelyProgressDialog({
    @required BuildContext context,
    String title,
    Color color = Colors.red,
    Gradient gradient,
		double landscapeWidth,
    Widget leading = const Icon(Icons.fast_forward, color: Colors.white),
    Radius borderRadius = const Radius.circular(5),
    ButtonTextTheme buttonsTextTheme,
    bool touchDismissible = true,
    bool backDismissible = true,
    this.type = LovelyProgressType.Linear,
		this.onFinish,
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
  Widget build(BuildContext context) =>
      baseDialog(_LovelyProgressContent(type,onFinish));
}

class _LovelyProgressContent extends StatefulWidget {
  final LovelyProgressType _type;
	final Function _onFinish;

  _LovelyProgressContent(this._type,this._onFinish);

  @override
  _LovelyProgressState createState() => _LovelyProgressState();
}

class _LovelyProgressState extends State<_LovelyProgressContent> {
  double _value;

  @override
  void initState() {
    super.initState();
    LovelyProgressSingleton.callback = updateValue;
  }

  void updateValue(double v) {
		if(v >= 1){
			if(widget._onFinish != null )
				widget._onFinish();
		}
		else{
			setState(() {
				_value = v;
			});
		}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: Center(
          child: getProgressIndicator(),
        ));
  }

  Widget getProgressIndicator() {
    switch (widget._type) {
      case LovelyProgressType.Linear:
        return LinearProgressIndicator(
          value: _value,
        );
      case LovelyProgressType.Circular:
        return Container(
					height: 70,
					width: 70,
					child: CircularProgressIndicator(
						value: _value,
					),
				);
      default:
        return null;
    }
  }

  @override
  void dispose() {
    LovelyProgressSingleton.callback = null;
    super.dispose();
  }
}

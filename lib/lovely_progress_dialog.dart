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

  LovelyProgressDialog({
    @required BuildContext context,
    String title,
    Color color = Colors.red,
    Gradient gradient,
    Widget leading = const Icon(Icons.fast_forward, color: Colors.white),
    Radius borderRadius,
    ButtonTextTheme buttonsTextTheme,
    bool touchDismissible,
    bool backDismissible,
    this.type = LovelyProgressType.Linear,
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
  Widget build(BuildContext context) =>
      baseDialog(_LovelyProgressContent(type));
}

class _LovelyProgressContent extends StatefulWidget {
  final LovelyProgressType _type;

  _LovelyProgressContent(this._type);

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
    setState(() {
      _value = v;
    });
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
        return CircularProgressIndicator(
          value: _value,
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

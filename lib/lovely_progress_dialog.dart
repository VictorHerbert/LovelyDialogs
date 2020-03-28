part of lovelydialogs;

class LovelyProgressSingleton{
	static Function(double) _callback;

	static set callback(func){
		_callback = func;
	}

	static bool hasDialogActive(){
		return (_callback != null);
	}


	static void setValue(double value){
		if(_callback != null)
			_callback(value);
	}
}

class LovelyProgressDialog extends LovelyDialog {
	
	//final Function updateCallback = progressCallback;

  LovelyProgressDialog({
    @required BuildContext context,
    Color color = Colors.red,
		Gradient gradient,
    Widget leading = const Icon(Icons.loop, color: Colors.white),
    String title,
  }) : super(context: context, color: color, leading: leading, title: title, gradient: gradient);

  show() {
    return showDialog(
      context: context,
      builder: (BuildContext context) => this,
    );
  }

	
  @override
  Widget build(BuildContext context) {
    return baseDialog(_LovelyProgressContent());
  }
}

class _LovelyProgressContent extends StatefulWidget {

  @override
  _LovelyProgressState createState() => _LovelyProgressState();
}

class _LovelyProgressState extends State<_LovelyProgressContent> {

	double value;

	@override
	void initState(){
		super.initState();
  	LovelyProgressSingleton.callback = updateValue;
	}

	void updateValue(double _value){
		setState(() {
		  value = _value;
		});
	}

  @override
  Widget build(BuildContext context) {
    return Container(
			height: 100,
			child: Center(
				child: LinearProgressIndicator(value: value,)
				//child: CircularProgressIndicator(value: value,),
			)
		);
  }

	@override
  void dispose() {
    LovelyProgressSingleton.callback = null;
    super.dispose();
  }

}


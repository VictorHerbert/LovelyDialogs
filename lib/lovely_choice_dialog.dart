part of lovelydialogs;

class LovelyChoiceDialog extends LovelyDialog {
	final Function(bool,int) onValueChanged;
  final Function(List<bool>) onConfirm;
  final Function onCancel;
  //final List<Widget> widgetList;
  final List<String> stringList;

  LovelyChoiceDialog({
    @required BuildContext context,
    Color color = Colors.red,
    Widget leading = const Icon(Icons.list, color: Colors.white),
    String title = '',
		Gradient gradient,

    //@required this.widgetList,
    this.stringList,
    @required this.onConfirm,
		this.onValueChanged,
    this.onCancel,
  }) : super(context: context, color: color, leading: leading, title: title, gradient: gradient);

  show() {
    return showDialog(
      context: context,
      builder: (BuildContext context) => this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return baseDialog(LovelyChoiceContent(stringList,onConfirm,onValueChanged));
  }
}

class LovelyChoiceContent extends StatefulWidget {
	final List<String> stringList;
	//final Color activeColor;
	final Function(List<bool>) onConfirm;
	final Function(bool,int) onValueChanged;
	
	LovelyChoiceContent(this.stringList,this.onConfirm,this.onValueChanged);

  @override
  _LovelyChoiceState createState() => _LovelyChoiceState();
}

class _LovelyChoiceState extends State<LovelyChoiceContent> {
	
	List<bool> checked = List.filled(20, false);

	_LovelyChoiceState(){
		//checked = List.filled(widget.stringList.length, false);
	}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Container(
          height: min(widget.stringList.length*60.0,MediaQuery.of(context).size.height*.3),
          child: ListView.builder(
              itemCount: widget.stringList.length,
              itemBuilder: (_, index){
								return ListTile(
									contentPadding: EdgeInsets.only(right: 0),
									title: Text(widget.stringList[index],),
									subtitle: null,
									trailing: Checkbox(
										activeColor: Colors.red,
										value: checked[index],
										onChanged: (value){
											if(widget.onValueChanged!= null) widget.onValueChanged(value,index);
											setState(() {
												checked[index] = !checked[index];
											});
										},
									),
								);
							}),
        ),
				SizedBox(height: 10,),
        Align(
          alignment: Alignment.bottomRight,
          child:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            FlatButton(
              //textTheme: buttonsTextTheme,
              onPressed: () {
                widget.onConfirm(checked);
								Navigator.of(context).pop();
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


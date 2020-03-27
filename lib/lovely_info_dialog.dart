part of lovelydialogs;

class LovelyInfoDialog extends LovelyDialog {
	final String preferenceID;
	final Function onConfirm;
	final String description;

  LovelyInfoDialog({
    @required BuildContext context,
		Color color = Colors.blue,
		Icon icon = const Icon(Icons.info),
		String title = '',

		@required this.description,
		this.preferenceID = '',
    this.onConfirm,    
  }) : super(
		context: context,
		color: color,
		icon: icon,
		title: title
	);


  @override
  Widget build(BuildContext context) {
    return baseDialog(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          description,
          style: TextStyle(color: Colors.grey,fontSize: 14,),
        ),
        SizedBox(
          height: 16,
        ),
        (preferenceID == '')? SizedBox(height: 0,) : Row(
          children: <Widget>[
            Checkbox(
              value: true,
              onChanged: (_) {},
            ),
            Text(
              'Don\'t show again',
              style: TextStyle(								
								fontSize: 14,
								fontWeight: FontWeight.bold
							),
            ),
						Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
														textTheme: buttonsTextTheme,
                            onPressed: () => onConfirm(),
                            child: Text(
                              "Confirm",
                              //style: TextStyle(fontSize: 20.0),
                            ),
                          )
                        ]),
                  )
          ],
        ),
      ],
    ));
  }
}
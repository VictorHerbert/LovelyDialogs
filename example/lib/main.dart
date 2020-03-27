import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:example/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:lovelydialogs/lovely_dialogs.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
		return BlocProvider(
			blocs: [
				Bloc((i) => ThemeBloc()),
			],
			child: Consumer<ThemeBloc>(
				builder: (BuildContext context, ThemeBloc bloc){
					return MaterialApp(
						//debugShowCheckedModeBanner: false,
						title: 'Lovely Dialogs',
						theme: ThemeData(
							primarySwatch: Colors.blue,
							brightness: bloc.isDark ? Brightness.dark : Brightness.light,
						),
						home: MyHomePage(title: 'Lovely Dialogs'),
					);
				}),
		);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          InkWell(
            child: Card(
              color: Colors.blue,
              child: Icon(Icons.info, color: Colors.white,),
            ),
            onTap: (){
              LovelyInfoDialog(
								context: context,
								title: 'Lovely Info Dialog',
								description: 'Lorem ipsum dolor sit amet, pat. Vivamus dui est, fin sisagittis tortor dui.',
								onConfirm: (){},
							).show();
            },
          ),
          InkWell(
            child: Card(
              color: Colors.green,
              child: Icon(Icons.comment, color: Colors.white),
            ),
            onTap: (){
              LovelyTextInputDialog(
								context: context,
								title: 'Lovely Info Dialog',
							).show();
            },
          ),
					InkWell(
            child: Card(
              color: Colors.red,
              child: Icon(Icons.list, color: Colors.white),
            ),
            onTap: (){
							//Checkbox()
              LovelyChoiceDialog(
								context: context,
								stringList: <String>[
									'Pizza','Hamburguer','Pie','Apple','ddf','34','wer','wef',
								],
								title: 'Order Some food',
								onConfirm: (checked){print(checked);},
								onValueChanged: (value,index) => print(value.toString() + " " + index.toString()),
							).show();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: BlocProvider.getBloc<ThemeBloc>().switchColor,
        tooltip: 'Increment',
        child: Icon(Icons.swap_calls),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

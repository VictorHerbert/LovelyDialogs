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
      child:
          Consumer<ThemeBloc>(builder: (BuildContext context, ThemeBloc bloc) {
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
								begin: Alignment.topLeft,
								end: Alignment.bottomRight,
								colors: <Color>[Colors.blue, Colors.green,Colors.green])),
        ),
      ),
      body: GridView.count(
				padding: EdgeInsets.only(top: 4),
        crossAxisCount: 2,
        children: <Widget>[
          InkWell(
            child: Card(
                child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                gradient: LinearGradient(colors: [Colors.blue, Colors.green]),
              ),
              child: Icon(
                Icons.list,
                color: Colors.white,
                size: MediaQuery.of(context).size.width / 15,
              ),
            )),
            onTap: () {
              LovelyInfoDialog(
                      context: context,
                      title: 'Pets',
                      leading: Icon(Icons.pets, color: Colors.white),
                      gradient:
                          LinearGradient(colors: [Colors.blue, Colors.green]),
                      description:
                          'Pets are cool, aren\'t they? So don\'t forget to give food and love!'
                      //onConfirm: (){},
                      )
                  .show();
            },
          ),
          InkWell(
            child: Card(
              color: Colors.green,
              child: Icon(
                Icons.comment,
                color: Colors.white,
                size: MediaQuery.of(context).size.width / 15,
              ),
            ),
            onTap: () {
							BlocProvider.getBloc<ThemeBloc>().isDialogActive = true;
              LovelyTextInputDialog(
                context: context,
                title: 'Comment on @facebook',
              ).show();
							
            },
          ),
          InkWell(
            child: Card(
                child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                gradient: LinearGradient(colors: [Colors.orange, Colors.red]),
              ),
              child: Icon(
                Icons.list,
                color: Colors.white,
                size: MediaQuery.of(context).size.width / 15,
              ),
            )),
            onTap: () {
              LovelyChoiceDialog(
                context: context,
                leading: Icon(Icons.fastfood, color: Colors.white),
                stringList: <String>[
                  'Pizza',
                  'Noodles',
                  'Pasta',
                  'Hambuguer',
                  'Pie',
                ],
                title: 'Order Some food',
                gradient: LinearGradient(colors: [Colors.orange, Colors.red]),
                onConfirm: (checked) {
                  print(checked);
                },
                onValueChanged: (value, index) =>
                    print(value.toString() + " " + index.toString()),
              ).show();
            },
          ),
          InkWell(
            child: Card(
              color: Colors.red,
              child: Icon(
                Icons.comment,
                color: Colors.white,
                size: MediaQuery.of(context).size.width / 15,
              ),
            ),
            onTap: () {
              LovelyTextInputDialog(
                context: context,
                title: 'Comment on @facebook',
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

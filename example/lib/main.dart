import 'dart:async';

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

	LovelyProgressDialog dialog;
	double value = 0;

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
                Icons.info,
                color: Colors.white,
                size: MediaQuery.of(context).size.width / 15,
              ),
            )),
            onTap: () {
              LovelyInfoDialog(
								context: context,
								title: 'Pets',
								leading: Icon(Icons.pets, color: Colors.white),
								gradient:LinearGradient(colors: [Colors.blue, Colors.green]),
								description:'Pets are cool, aren\'t they? So don\'t forget to give food and love!',
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
                onConfirm: (checked) => print(checked),
                onValueChanged: (value, index) => print(value.toString() + " " + index.toString()),
              ).show();
            },
          ),
          InkWell(
            child: Card(
              color: Colors.red,
              child: Icon(
                Icons.subscriptions,
                color: Colors.white,
                size: MediaQuery.of(context).size.width / 15,
              ),
            ),
            onTap: () {
							LovelyProgressDialog(context: context,).show();

							value = 0;				
							Timer.periodic(Duration(milliseconds: 100), (timer) {
								if((value >= 1) || !LovelyProgressSingleton.hasDialogActive()) timer.cancel();

								print(value+=.01);
								LovelyProgressSingleton.setValue(value);
							});
            },
          ),
					InkWell(
            child: Card(
              child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                gradient: LinearGradient(colors: [Colors.yellow, Colors.pink]),
              ),
              child: Icon(
                Icons.list,
                color: Colors.white,
                size: MediaQuery.of(context).size.width / 15,
              ),
            )),
            onTap: () {
							LovelyCustomDialog(
                context: context,
								child: Column(
									children: <Widget>[
										FlutterLogo(size: 200),
										SizedBox(height: 8,),
									],
								),
              ).show();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: BlocProvider.getBloc<ThemeBloc>().switchColor,
        tooltip: 'Change theme',
        child: Icon(Icons.sync),
      ),
    );
  }
}

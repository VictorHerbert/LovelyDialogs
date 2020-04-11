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
          debugShowCheckedModeBanner: false,
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

  Widget getCard({IconData iconData, Color color, Function onTap}) {
    return InkWell(
      child: Card(
          child: Container(
        decoration: BoxDecoration(
            color: color,
            //border: Border.all()
            borderRadius: BorderRadius.all(Radius.circular(4))),
        //borderRadius: BorderRadius.all(Radius.circular(5)),
        child: Icon(
          iconData,
          color: Colors.white,
          size: MediaQuery.of(context).size.width / 15,
        ),
      )),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.pink])),
        ),
      ),
      body: GridView.count(
        padding: EdgeInsets.only(top: 4),
        crossAxisCount: 2,
        children: <Widget>[
          getCard(
              iconData: Icons.info,
              color: Colors.blue,
              onTap: () => LovelyInfoDialog(
                    context: context,
                    title: 'Pets',
                    leading: Icon(Icons.pets, color: Colors.white),
                    gradient:
                        LinearGradient(colors: [Colors.blue, Colors.green]),
                    description:
                        'Pets are cool, aren\'t they? So don\'t forget to give food and love!',
                  ).show()),
          getCard(
            iconData: Icons.comment,
            color: Colors.green,
            onTap: () => LovelyTextInputDialog(
              context: context,
              hintIcon: Icon(Icons.comment),
              hintText: 'Comment',
              title: 'Comment on Facebook',
              buttonsTextTheme: ButtonTextTheme.accent,
            ).show(),
          ),
          getCard(
            iconData: Icons.list,
            color: Colors.orange,
            onTap: () => LovelyChoiceDialog(
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
              onValueChanged: (value, index) =>
                  print(value.toString() + " " + index.toString()),
            ).show(),
          ),
          getCard(
              iconData: Icons.fast_forward,
              color: Colors.red,
              onTap: () {
                LovelyProgressDialog(
                  context: context,
                ).show();

                value = 0;
                Timer.periodic(Duration(milliseconds: 100), (timer) {
                  if ((value >= 1) ||
                      !LovelyProgressSingleton.hasDialogActive())
                    timer.cancel();

                  print(value += .01);
                  LovelyProgressSingleton.setValue(value);
                });
              }),
          getCard(
            iconData: Icons.favorite,
            color: Colors.pink,
            onTap: () => LovelyCustomDialog(
              gradient: LinearGradient(colors: [Colors.blue, Colors.pink]),
              context: context,
              child: Column(
                children: <Widget>[
                  FlutterLogo(
                      size: 200,
                      style: FlutterLogoStyle.stacked,
                      duration: Duration(seconds: 50)),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ).show(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: BlocProvider.getBloc<ThemeBloc>().switchColor,
        tooltip: 'Change theme',
        child: Icon(Icons.sync),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lovelydialogs/lovelydialogs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LovelyDialogs Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'LovelyDialogs Demo'),
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
  void _incrementCounter() {
    LovelyInfoDialog(
      context: context,
      description: 'aleleekekekekekekke',
    ).show();
    print('foi');
    //setState(() {});
  }

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
              child: Icon(Icons.info),
            ),
            onTap: (){
              LovelyInfoDialog(description: 'aleleekekekekekekke',);
            },
          ),
          InkWell(
            child: Card(
              color: Colors.red,
              child: Icon(Icons.info),
            ),
            onTap: (){
              LovelyChoiceDialog();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

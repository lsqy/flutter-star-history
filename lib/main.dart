import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.brown
      ),
      routes: {
        'new_page': (context) => NewRoute(),
        '/': (context) => MyHomePage(title: 'Flutter Home'),
        'tip2': (context) => TipRoute(
          text: ModalRoute.of(context).settings.arguments
        )
      },
      // home: new MyHomePage(
      //   title: 'Flutter Demo Home Page'
      // ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key, this.title
  }) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('You have pushed the button this many times:',),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display3,
            ),
            FlatButton(
              child: Text('open a new route'),
              textColor: Colors.cyan,
              onPressed: () {
                Navigator.pushNamed(context, 'new_page');
                // Navigator.push( context,
                //   new MaterialPageRoute(builder: (context) {
                //     return NewRoute();
                //   }, 
                //   maintainState: true,
                //   fullscreenDialog: true)
                // );
              },
            ),
            RaisedButton(
              onPressed: () async {
                var result = await Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) {
                      return TipRoute(text: '我是lsqy',
                      );
                    },
                  ),
                );
                print('路由返回值：$result');
              },
              child: Text('打开提示页')
            ),
            RaisedButton(
              onPressed: () async {
                var result = await Navigator.of(context).pushNamed('tip2', arguments: 'hi');
                print('路由返回值：$result');
              },
              child: Text('打开tip2')
            ),
            RandomWordsWidget(),
          ],
        ),
      ),
        floatingActionButton: new FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        ),
      );
    }
  }

class NewRoute extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New route')
      ),
      body: Center(
        child: Text('This is a new route')
      ),
    );
  }
}

class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text,
  }): super(key: key);
  final String text;
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('提示'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18), 
        child: Center( 
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context, '我是路由返回值'),
                child: Text('返回')
              )
            ],
          )
        )
      )
    );
  }
}

class RandomWordsWidget extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString())
    );
  }
}
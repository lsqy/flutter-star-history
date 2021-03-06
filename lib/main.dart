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
            RaisedButton(
              onPressed: () async {
                var result = await Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) {
                      return Echo(text: 'hello lsqy');
                    },
                  ),
                );
                print('路由返回值：$result');
              },
              child: Text('StatelessWidget')
            ),
            RaisedButton(
              onPressed: () async {
                Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return ContextRoute();
                  }, 
                  maintainState: true,
                  fullscreenDialog: true)
                );
              },
              child: Text('ContextRoute')
            ),
            RaisedButton(
              onPressed: () async {
                Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return TapboxA();
                  }, 
                  maintainState: true,
                  fullscreenDialog: true)
                );
              },
              child: Text('tabboxA')
            ),
            RaisedButton(
              onPressed: () async {
                Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return ParentWidget();
                  }, 
                  maintainState: true,
                  fullscreenDialog: true)
                );
              },
              child: Text('tabboxB')
            ),
            RaisedButton(
              onPressed: () async {
                Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return ParentWidgetC();
                  }, 
                  maintainState: true,
                  fullscreenDialog: true)
                );
              },
              child: Text("Hello world "*6,  //字符串重复六次
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textScaleFactor: 2.5,
                )
            ),
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            //进度条显示50%
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .5, 
            ),
            // 模糊进度条(会执行一个旋转动画)
            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            //进度条显示50%，会显示一个半圆
            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .5,
            ),
            // 圆形进度条直径指定为100
            SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .7,
              ),
            ),
            Column(
              //测试Row对齐方式，排除Column默认居中对齐的干扰
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(" hello world "),
                    Text(" I am Jack "),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(" hello world "),
                    Text(" I am Jack "),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  textDirection: TextDirection.rtl,
                  children: <Widget>[
                    Text(" hello world "),
                    Text(" I am Jack "),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,  
                  verticalDirection: VerticalDirection.up,
                  children: <Widget>[
                    Text(" hello world ", style: TextStyle(fontSize: 30.0),),
                    Text(" I am Jack "),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("hi"),
                Text("world"),
              ],
            )
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

class Echo extends StatelessWidget {
  const Echo({
    Key key,
    @required this.text,
    this.backgroundColor: Colors.grey,
  }):super(key:key);

  final String text;
  final Color backgroundColor;

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StatelessWidget'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18), 
        child: Center( 
          child: Container(
            color: backgroundColor,
            child: Text(text),
          ),
        )
      )
    );
  }
}

class ContextRoute extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('lsqy Context测试')
      ),
      body: Container(
        child: Builder(builder: (context) {
          Scaffold scaffold = context.findAncestorWidgetOfExactType();
          return (scaffold.appBar as AppBar).title;
        }),
      ),
    );
  }
}

class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => new _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

// ParentWidget 为 TapboxB 管理状态.

//------------------------ ParentWidget --------------------------------

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//------------------------- TapboxB ----------------------------------

class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

//---------------------------- ParentWidget ----------------------------

class ParentWidgetC extends StatefulWidget {
  @override
  _ParentWidgetCState createState() => new _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//----------------------------- TapboxC ------------------------------

class TapboxC extends StatefulWidget {
  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapboxCState createState() => new _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // 在按下时添加绿色边框，当抬起时，取消高亮  
    return new GestureDetector(
      onTapDown: _handleTapDown, // 处理按下事件
      onTapUp: _handleTapUp, // 处理抬起事件
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(widget.active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? new Border.all(
                  color: Colors.teal[700],
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:myapp/pages/01state.dart';
import 'package:myapp/pages/02statemanage.dart';
import 'package:myapp/pages/03statemanage.dart';
import 'package:myapp/pages/04statemanage.dart';
import 'package:myapp/pages/05cupertino.dart';

import 'package:english_words/english_words.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //注册路由表
      routes:{
        'new_page':(context)=>NewRoute(),
        'new_page_arg':(context)=>NewRouteArg(),
        'StatefulWidgetLifeCycle':(context)=>NewRoute_state(),
        'StateManage1':(context)=>NewRouteStateManage(),
        'StateManage2':(context)=>NewRouteStateManageParent(),
        'StateManage3':(context)=>NewRouteStateManagefix(),
        'CupertinoDemo':(context)=>CupertinoDemo(),
        'WebView':(context)=>new WebviewScaffold(
          url: "https://m.tjresearch.cn",
          appBar: new AppBar(
            title: new Text("腾景经济预测"),
          ),
        ),
      },
      //基线网格调试
      // debugShowMaterialGrid: true,
      //应用程序性能图
      // showPerformanceOverlay: true,
      
      home: MyHomePage(title: 'Flutter Demo Hme Page'),
    );
  }
}
// "https://m.tjresearch.cn",
// routes: {
//         "/": (_) => new WebviewScaffold(
//           url: "https://www.google.com",
//           appBar: new AppBar(
//             title: new Text("Widget webview"),
//           ),
//         ),
//       },

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
 
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text('open new route'),
              textColor: Colors.blue,
              onPressed: (){
                //导航到新路由
                // Navigator.push(context,
                //   new MaterialPageRoute(
                //     //一个WidgetBuilder类型的回调函数，它的作用是构建路由页面的具体内容，返回值是一个widget。我们通常要实现此回调，返回新路由的实例
                //     builder: (context){
                //       return new NewRoute();
                //     },
                //     //默认情况下，当入栈一个新路由时，原来的路由仍然会被保存在内存中，如果想在路由没用的时候释放其所占用的所有资源，可以设置maintainState为false。
                //     maintainState: false,
                //     //表示新的路由页面是否是一个全屏的模态对话框，在iOS中，如果fullscreenDialog为true，新页面将会从屏幕底部滑入（而不是水平方向）。
                //     fullscreenDialog: false
                //   )
                // );
                
                //通过路由名打开新路由页
                Navigator.pushNamed(context, 'new_page');
              },
            ),
            FlatButton(
              child:Text('open new route with arg'),
              textColor: Colors.red,
              onPressed: (){
                Navigator.of(context).pushNamed("new_page_arg",arguments: 'hi');
              },
            ),
            FlatButton(
              child: Text('StatefulWidgetLifeCycle'),
              onPressed: (){
                Navigator.of(context).pushNamed('StatefulWidgetLifeCycle');
              },
            ),
            FlatButton(
              child: Text('StateManage1-自管理'),
              onPressed: (){
                Navigator.of(context).pushNamed('StateManage1');
              },
            ),
            FlatButton(
              child: Text('StateManage2-父级管理'),
              onPressed: (){
                Navigator.of(context).pushNamed('StateManage2');
              },
            ),
            FlatButton(
              child: Text('IOS风格demo'),
              onPressed: (){
                Navigator.of(context).pushNamed('CupertinoDemo');
              },
            ),
            FlatButton(
              child: Text('WebView'),
              onPressed: (){
                Navigator.of(context).pushNamed('WebView');
              },
            ),
            RandomWordsWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//创建一个新路由，命名'newRoute'
class NewRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:Text('New route'),
      ),
      body:Center(child: Text('This is new route'),)
    );
  }
}
//创建一个可以接收参数的新路由，命名'NewRouteArg'
class NewRouteArg extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    //获取路由参数
     var args=ModalRoute.of(context).settings.arguments;
     return Scaffold(
      appBar:AppBar(
        title:Text('New route'),
      ),
      body:Center(child: Text('This is new route with $args'),)
    );
  }
}
//路由 - 跳转到 'state'生命周期页
class NewRoute_state extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return CounterWidget();
    // return Text("aaa");
  }
}
//路由 - 状态管理页1
class NewRouteStateManage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return TapboxA();
  }
}
//路由 - 状态管理页2 父级管理状态
class NewRouteStateManageParent extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return ParentWidget();
  }
}
//路由 - 状态管理页2 混合管理状态
class NewRouteStateManagefix extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return ParentWidgetC();
  }
}
//路由 - 状态管理页2 混合管理状态
class CupertinoDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return CupertinoTestRoute();
  }
}

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // 生成随机字符串
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}

import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    Key key,
    this.initValue: 0
  });

  final int initValue;

  @override
  _CounterWidgetState createState() => new _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {  
  int _counter;

  @override
  void initState() {
    super.initState();
    //初始化状态  
    _counter=widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('$_counter'),
          //点击后计数器自增
          onPressed:()=>setState(()=> ++_counter,
          ),
        ),
      ),
    );
  }

  @override
  //在widget重新构建时，Flutter framework会调用Widget.canUpdate来检测Widget树中同一位置的新旧节点，然后决定是否需要更新，
  // 如果Widget.canUpdate返回true则会调用此回调。正如之前所述，Widget.canUpdate会在新旧widget的key和runtimeType同时相等时会返回true，
  // 也就是说在在新旧widget的key和runtimeType同时相等时didUpdateWidget()就会被调用。
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  //当State对象从树中被移除时，会调用此回调
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  @override
  //当State对象从树中被永久移除时调用；通常在此回调中释放资源。
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  //在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用。
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  //当State对象的依赖发生变化时会被调用；
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

}
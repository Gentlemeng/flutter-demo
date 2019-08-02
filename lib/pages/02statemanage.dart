import 'package:flutter/material.dart';

//自身状态管理


class TapboxA extends StatefulWidget{
  TapboxA ({Key key}) : super(key:key);
  @override
  _TapboxAStae createState()=> new _TapboxAStae();  
}
class _TapboxAStae extends State<TapboxA>{
  bool _active = false;
  void _handleTap(){
    setState(() {
      _active = !_active;
    });
  }
  Widget build(BuildContext context){
    return new GestureDetector(
      onTap: _handleTap,
      child:new Container(
        child: new Center(
          child: Text(
            _active?'Active':'Inactive',
            style:TextStyle(fontSize: 32.0,color:Colors.white)
          ),
        ),
        width: 200,
        height: 200,
        decoration: new BoxDecoration(
          color:_active?Colors.lightGreen[700]:Colors.grey[600]
        ),
      )
    );
  }
}
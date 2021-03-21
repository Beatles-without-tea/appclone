import 'package:flutter/material.dart';

import './bottomtabbar.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      child:tabs(),
      );
  }
}



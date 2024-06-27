import 'package:flutter/material.dart';
import 'package:ams/Utils/size_config.dart';
import 'package:ams/Utils/font_style.dart';
import 'package:ams/Utils/reusable_text.dart';
import 'package:ams/Utils/outline_button.dart';
import 'package:ams/Utils/round_button.dart';
import 'package:ams/Utils/colour.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AMS App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppConst.theme,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('AMS')),
        ),
        body: const Center(
        ),
      ),
    );
  }
}

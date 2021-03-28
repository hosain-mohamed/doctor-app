import 'package:flutter/material.dart';
import 'package:doctor_app/presentation/doctor_app.dart';
import 'package:doctor_app/size_confige.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Doctor App',
      theme: ThemeData(
        fontFamily: "Nunito",
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Builder(builder: (context) {
        SizeConfig.initSize(context);
        return DoctorScreen();
      }),
    );
  }
}

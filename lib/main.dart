import 'package:apitemplate/login.dart';
import 'package:flutter/material.dart';
import 'package:apitemplate/posts.dart';
// import 'login.dart';
void main() {
 runApp(MyApp());
}
class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 title: 'HTTP',
 debugShowCheckedModeBanner: false,
 theme: ThemeData(
 primarySwatch: Colors.blue,
 visualDensity: VisualDensity.adaptivePlatformDensity,
 ),
 home: Login(),

 );
 }
}
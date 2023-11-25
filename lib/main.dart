import 'package:flutter/material.dart';
import 'package:flutter_application_1/startpage.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
    title: "Start Page",
    home: Startpage() ,
    debugShowCheckedModeBanner: false,
    );
      
  
  }
}





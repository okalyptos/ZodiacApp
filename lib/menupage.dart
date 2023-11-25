import 'package:flutter/material.dart';
import 'package:flutter_application_1/whatismychinese.dart';
import 'package:flutter_application_1/whatismysign.dart';

class Menupage extends StatelessWidget {
const Menupage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Menu",
    home: Scaffold(
    appBar: AppBar(
    title: Text("Menu"),
    backgroundColor: Colors.black,
    ),

    //drawer start
    drawer: Drawer(
    backgroundColor: Colors.grey[500],
    child: ListView(
    children: [
    //first list element
    ListTile(
    title: Text("What is My Chinese Zodiac"),
    onTap: () {
    Navigator.push(context,MaterialPageRoute(builder: (context) => Chinese()));
    }
    ),
    //second list element
    ListTile(
    title: Text("What is My Zodiac Sign"),
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => mysign()));
    }
    )
    ],
    )
    ),
            
    //body start
    body:
    Container(
    color: const Color.fromRGBO(158, 158, 158, 1),
    child:
    //column that handle all the page element
    Column(
    children:[
    SizedBox(height: 50,),
    Text("Unlock Your Destiny: Exploring Your Zodiac",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400 )),
    //first created row
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    //first column
    Column(
    children: [
    SizedBox(height: 200),
    Text("What is My Chinese Zodiac",style: TextStyle(fontSize: 20),),
    //create sapce between text and button
    SizedBox(height: 15),
    //first button
    ElevatedButton(onPressed: (){
    Navigator.push(context,MaterialPageRoute(builder: (context) => Chinese()));
    },
    child: Text("GO"),
    style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    fixedSize: Size(50,50),
    primary: Colors.teal)
    )
    ],
    ),
    //make space between column
    SizedBox(width: 500,),

    //Second Column
    Column(
    children: [
    SizedBox(height: 200),
    Text("What is My Zodiac Sign",style: TextStyle(fontSize: 20)),
    //create space between text and button
    SizedBox(height: 15,),
    //Second button
    ElevatedButton(onPressed: (){
    Navigator.push(context,MaterialPageRoute(builder: (context) => mysign()));
    },
    child: Text("GO"),
    style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    fixedSize: Size(50,50),
    primary: Colors.teal,)
    )
    ],
    )       
    ],
    ),
    ],
    ),
    ),
    ),
    );

    }
    
    }
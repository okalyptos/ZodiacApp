import 'package:flutter/material.dart';
import 'package:flutter_application_1/getimagesign.dart';
import 'package:flutter_application_1/menupage.dart';
import 'package:flutter_application_1/whatismychinese.dart';
import 'calculatesign.dart';
import 'signmoreinfo.dart';

class mysign extends StatefulWidget {
  const mysign({ Key? key }) : super(key: key);

 @override
  State<mysign> createState() => _mysign();
}

class _mysign extends State<mysign> {
  bool check = false;
  DateTime? seldate;
  String? zodiac;
  // method to show the picker and that get the zodiac value
  void _selectDate(BuildContext context) async {
      final ThemeData calendarcolor = ThemeData(
      colorScheme: ColorScheme.light().copyWith(
      primary: Colors.black,
      onPrimary: Color.fromARGB(255, 255, 255, 255),),
      dialogBackgroundColor: Colors.white
      );

      //showdatepciker used to pop up the date selection
      final DateTime? picked = await showDatePicker(  
      context: context,
      initialDate: seldate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
      return Theme(
      data: calendarcolor,
      child: child ?? Container(),
      );
      },
      );
          
      if (picked != null && picked != seldate) {
      setState(() {
      seldate = picked;
      //call the calculate method
      zodiac = calculatezodiacsign(picked.month,picked.day);
      });
      }
      }
  
      @override
      Widget build(BuildContext context) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "What is My Zodiac Sign",
      home: Scaffold(
      appBar: AppBar(
      title: Text("What is My Zodiac Sign"),
      backgroundColor: Colors.black,
      ),

      drawer: Drawer(
      backgroundColor: Colors.grey[500],
      child: ListView(
      children: [
        //first element in the drawer
      ListTile(
      title: Text("What is My Chinese Zodiac"),
      onTap: () {
      Navigator.push(context,MaterialPageRoute(builder: (context) => Chinese()));
      }            
      ),
      //second element
      ListTile(
      title: Text("What is My Zodiac Sign"),
      onTap: () {
      Navigator.push(context,MaterialPageRoute(builder: (context) => mysign()));
      }
      ),
      //third element
      ListTile(
      title: Text("Back To Menu"),
      onTap: () {
      Navigator.push(context,MaterialPageRoute(builder: (context) => Menupage()));
      }
      )
      ],
      )
      ),

      body: Container(
      alignment: Alignment.topCenter,
      color: Colors.grey[500],
      child:
      Center(
        //create column to put the page elemtn in it
        child: Column(
        children:[
        //create space between appbar and the title
        SizedBox(height: 50,),
        Text("Calculate your zodiac sign by entering your date of birth.",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
        //create space between the title and the icon
        SizedBox(height: 10,),
        Icon(Icons.arrow_drop_down,size: 100,),
        //create space between icon the date picker
        SizedBox(height: 25),
        ElevatedButton(
        onPressed: () => _selectDate(context),
        child: Text('Select Date of Birth',style: TextStyle(fontSize: 25),),
        style: ElevatedButton.styleFrom(
        primary: Colors.teal),
        ),
        //create space between pciker and the zodiac text
        SizedBox(height: 40),
        if (seldate != null)
        Text('Your Zodiac Sign: $zodiac',style: TextStyle(fontSize: 25,fontStyle: FontStyle.italic),
        ),
        //space between the text and photo
        SizedBox(height: 10,),
        //clipoval used to put inside it the photo to look like a round
        ClipOval(
        child:
        Image.asset(
        //call the image method
        getsignimage(zodiac),
        width: 150,
        height: 150,
        fit:BoxFit.fill
        ),
        ),
        //create row to put inside it the more info
        Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        //create a space between the left edge and the more info
        SizedBox(width:70 ,),
        //create a column to put inside it rows
        Column(
        children:[
        //first row in the column
        Row(
        children: [
        Text("More Info: ",textAlign: TextAlign.left,style: TextStyle(fontSize: 25),),
        //checkbox to show info when true                  
        Checkbox(value: check, onChanged:(value) {
        setState(() {
        check = value!;
        });                                         
        },
        ),
        ],
        ),
        //second row in the column
        Row(
        children: [
        //create space between the text an the more row
        SizedBox(height: 15,)
        ],
        ),
        //third row to show the info in it
        Row(
        children: [
        //if checkbox true call the moethod to show the info
        if(check == true)
        Text(
        getinfosign(zodiac),style: TextStyle(fontSize: 17),
        )
        ]
        )
        ],
        )
        ],
        ),
        ],
        ),
        ),
        ),

        )
        );
        
        }
        }
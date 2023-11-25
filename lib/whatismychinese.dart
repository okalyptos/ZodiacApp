
import 'package:flutter/material.dart';
import 'package:flutter_application_1/menupage.dart';
import 'calculatezodiac.dart';
import 'whatismysign.dart';
import 'getimage.dart';
import 'chinmoreinfo.dart';

class Chinese extends StatefulWidget {
  const Chinese({super.key});

  @override
  State<Chinese> createState() => _Chinese();
}

class _Chinese extends State<Chinese> {
  DateTime? seldate;
  String? zodiac;
  bool check = false;
  // method to show the picker and that get the zodiac value
  void _selectDate(BuildContext context) async {
    final ThemeData calendarcolor = ThemeData(
    colorScheme: ColorScheme.light().copyWith(
    primary: Colors.black,
    onPrimary: Color.fromARGB(255, 255, 255, 255),),
    dialogBackgroundColor: Colors.white
    );

    //ShowDatePicker used to pop up the date selection
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
          
    if(picked != null && picked != seldate) {
    setState(() {
    seldate = picked;
    //call the calcualte method
    zodiac = calculatezodiac(picked.year);
    });
    }
    }
  
    @override
    Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "What is My Chinese Zodiac",
    home: Scaffold(
    appBar: AppBar(
    title: Text("What is My Chinese Zodiac"),
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
    Navigator.push(
    context,MaterialPageRoute(builder: (context) => Chinese()));
    }
    ),
    //second element
    ListTile(
    title: Text("What is My Zodiac Sign"),
    onTap: () {
    Navigator.push(context,MaterialPageRoute(builder: (context) => mysign()));
    }
    ),
    //thirs element
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
    //create column to put the page element in it
    child: Column(   
    children:[
    //create sapce between appbar and the title
    SizedBox(height: 50,),
    Text("Calculate your chinese zodiac by entering your date of birth.",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
    //create space between title and icon
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
    //create space betwen pciker and the zodiac text
    SizedBox(height: 40),
    if (seldate != null)
    Text('Your Chinese Zodiac: $zodiac',style: TextStyle(fontSize: 25,fontStyle: FontStyle.italic),
    ),
    //space between the text and photo
    SizedBox(height: 10),
    //clipoval used to put inside it the photo to look like a round
    ClipOval(
    child:
    Image.asset(
    //call the image method
    getImagePath(zodiac),
    width: 150,
    height: 150,
    fit:BoxFit.fill
    ),
    ),
    //created a row to put inside it the more info
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
    //create a space between the text and the more info
    SizedBox(height: 15,)
    ],
    ),
    //third row to show the info in it
    Row(                   
    children: [  
    //if checkbox is true call the method to show the info                   
    if(check == true)
    Text(
    getinfo(zodiac),style: TextStyle(fontSize: 17),
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
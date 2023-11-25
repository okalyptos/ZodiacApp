import 'package:flutter/material.dart';
import 'package:flutter_application_1/menupage.dart';

class Startpage extends StatelessWidget {
const Startpage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      appBar: AppBar(
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
        centerTitle: true,
        title: Text("Welcome To The Zodiac Realm 🌌",style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 0, 0, 0)
        ),
        body: Stack(
          children: [
            Positioned.fill(
            child: ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7),BlendMode.srcATop),
            child: Image.asset('images/space.jpg',fit: BoxFit.cover,)),),
            
            
            
          Center(
          child:
          Center(child: ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Menupage()));

         },
        child: Text("Start",style: TextStyle(fontSize: 20),),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          fixedSize: Size(100,50),
          primary: Colors.grey[700]

        )

        ),
  


        ),
        ),
        ],


        )
        
    




        );
        
        

    








  
  }
}

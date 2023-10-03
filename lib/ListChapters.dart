
import 'package:flutter/material.dart';
import 'Model/chapters.dart';
class listChapter extends StatefulWidget{
  @override
  State<listChapter> createState()=>_listChapter();
}

class _listChapter extends State<listChapter>{
  
  List<cahpters> groupChapters=[
    cahpters(Nom: "CS CHAPTER", ImaggPath: "images/"),
    cahpters(Nom: "WIE CHAPTER", ImaggPath: "images/"),
    cahpters(Nom: "RAS CHAPTER", ImaggPath: "images/"),
    cahpters(Nom: "IAS CHAPTER", ImaggPath: "images/"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title:const Center(child: Text("Welcome To IEEE"),)
      ,actions:<Widget> [
          Padding(padding: EdgeInsets.only(right: 15),child:Icon(Icons.info),)
      ],),
    //  body: //GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder),
    );
  }
}
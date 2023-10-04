import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:member_ieee/InfoDeveloper.dart';
import 'package:member_ieee/Model/Member.dart';
import 'Model/chapters.dart';
import 'PgesForMembers.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ListChapter extends StatefulWidget {
  @override
  State<ListChapter> createState() => _ListChapter();
}
class _ListChapter extends State<ListChapter> {
  
final storage = new FlutterSecureStorage();

int countIEE=0;
int payerIEE=0;
int NotPayerIEEE=0;

void getFromLocalStoreg() async {
  final usersJson = await storage.read(key: "Members");
  if (usersJson != null) {
    final userdecode = jsonDecode(usersJson);
    List<Member> data = userdecode.map<Member>((user) => Member.fromJson(user)).toList();
    setState(() {
        countIEE=data.length;
        payerIEE=data.where((element) => element.ispayer==true).length;
        NotPayerIEEE=data.where((element) => element.ispayer==false).length;
    });
  }
}

  @override
  void initState(){
    super.initState();
    getFromLocalStoreg();
  }

   
  List<cahpters> groupChapters = [
    cahpters(Nom: "CS", ImaggPath: "images/cs.PNG"),
    cahpters(Nom: "WIE", ImaggPath: "images/wie.PNG"),
    cahpters(Nom: "RAS", ImaggPath: "images/ras.PNG"),
    cahpters(Nom: "IAS", ImaggPath: "images/ias.PNG"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(child: Text("Welcome To IEEE")),
        actions: <Widget>[
           IconButton(onPressed: 
             (){Navigator.push(context,MaterialPageRoute(builder: (context)=> InfoDeveloper(Memebrs:countIEE,NotpayerNumber: NotPayerIEEE,payerNumber: payerIEE,)));}
           , icon: const Icon(Icons.info))
        ],
      ),
      body: Center(
        child: Padding(padding:const EdgeInsets.only(top: 120),child: GridView.builder(
          itemCount: groupChapters.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            final data = groupChapters[index];
              return GestureDetector(
                onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>PagesForMember(NameChapter: data.Nom.toString())));
                },
                child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    data.ImaggPath,
                  ),
                ],
              ),
            ),);
          },
        ))
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'Model/chapters.dart';
import 'PgesForMembers.dart';
class ListChapter extends StatefulWidget {
  @override
  State<ListChapter> createState() => _ListChapter();
}

class _ListChapter extends State<ListChapter> {
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
           Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.info),
          )
        ],
      ),
      body: Center(
        child: Padding(padding: EdgeInsets.only(top: 120),child: GridView.builder(
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

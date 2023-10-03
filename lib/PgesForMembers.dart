import 'package:flutter/material.dart';
import 'package:member_ieee/Model/Member.dart';
import 'Model/chapters.dart';

class PagesForMember extends StatefulWidget {

  PagesForMember({super.key,required this.NameChapter});
  String  NameChapter;

  @override
  State<PagesForMember> createState() => _PagesForMember();
}

class _PagesForMember extends State<PagesForMember> {

 List<Member> Members=[];

  @override
  void initState() {
    Members=getMember();
    super.initState();
  }

  List<Member> getMember(){
    return [
        Member(nom: "ghassen", lastname: "mejri", email: "talel@gmail.com", ispayer: true, present: false, chaptername: "RAS"),
        Member(nom: "Hkimi", lastname: "mejri", email: "talel@gmail.com", ispayer: false, present: false, chaptername: "IAS"),
        Member(nom: "talel", lastname: "mejri", email: "talel@gmail.com", ispayer: true, present: false, chaptername: "CS")
    ].where((element) => element.chaptername == widget.NameChapter.toString()).toList();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.NameChapter,
          style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
          body: ListView.builder(itemCount: Members.length,itemBuilder: (context,index){
            final data=Members[index];
              return Card(
                child: ListTile(
                 leading: Checkbox(value: data.present,onChanged: (val){
                  setState(() {
                      Members[index].present=val!;
                  });
                 },),
                 title: Text(data.nom +" "+data.lastname),
                 subtitle: Text(data.email),
                 trailing: Text(data.ispayer ? 'Payer ' : "No Payer"),
              ),
              );
          }),
    );
  }
}

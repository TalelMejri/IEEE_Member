import 'package:flutter/material.dart';

class AddMember extends StatefulWidget {
   AddMember({super.key,required this.chapterName});
  String ? chapterName;

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add Member"),),
    );
  }
}
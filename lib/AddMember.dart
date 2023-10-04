import 'package:flutter/material.dart';

class AddMember extends StatefulWidget {
   AddMember({super.key,required this.chapterName,required this.addInLocalStorageMember});
   String  chapterName;
   final addInLocalStorageMember;
  

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {

  final _formKey = GlobalKey<FormState>();

  String nom="";
  String lastname="";
  String email="";

  void AddMemeber(){
    if(_formKey.currentState!.validate()){
        widget.addInLocalStorageMember(nom,lastname,email);
        Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Add Member"),),
        body: SingleChildScrollView(
          child: Padding(padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
               Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                 ),
                child:Image.asset("images/${widget.chapterName.toLowerCase()}.PNG"),
              ),
            Form(key: _formKey,child: Column(
               children: [
                TextFormField(
                   autovalidateMode:AutovalidateMode.onUserInteraction ,
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return "Nom Required";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      nom=value;
                    });
                  },
                    decoration: const InputDecoration(
                       label: Text("Nom")
                    ),
                  ),
                  const SizedBox(height: 20),
                   TextFormField(
                     autovalidateMode:AutovalidateMode.onUserInteraction ,
                     validator: (value){
                    if(value==null || value.isEmpty){
                      return "LastName Required";
                    }
                    return null;
                  },
                   onChanged: (value) {
                    setState(() {
                      lastname=value;
                    });
                  },
                    decoration: const InputDecoration(
                       label: Text("LastName")
                    ),
                  ),
                  const SizedBox(height: 20),
                   TextFormField(
                     autovalidateMode:AutovalidateMode.onUserInteraction ,
                     validator: (value){
                    if(value==null || value.isEmpty){
                      return "Email Required";
                    }
                    return null;
                  },
                    onChanged: (value) {
                    setState(() {
                      email=value;
                    });
                  },
                    decoration:const InputDecoration(
                       label: Text("Email")
                    ),
                  ),
                     const SizedBox(height: 20),
                     ElevatedButton(onPressed: (){AddMemeber();}, child: const Text("ADD")),
               ],
            ))
          ],  
        ),),
        )
    );
  }
}
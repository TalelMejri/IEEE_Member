import 'package:flutter/material.dart';
import 'package:member_ieee/main.dart';

class InfoDeveloper extends StatelessWidget {
   InfoDeveloper({super.key,required this.Memebrs,required this.payerNumber,required this.NotpayerNumber});
   int Memebrs;
   int payerNumber;
   int NotpayerNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               ClipRRect(
                  borderRadius: BorderRadius.circular(30), 
                  child: Image.asset("images/profil.jpg", width: 120),
                ),
                const DrawerHeader(child: Text("Talel Mejri")),
              ],
            ),
        ),
            appBar: AppBar(
              elevation: 5,iconTheme:const  IconThemeData(color: Colors.blue),
              backgroundColor: Colors.white,
              actions: [
                IconButton(onPressed: (){Navigator.of(context).pop();}, icon:const Icon(Icons.home))
              ]),
             body:   Padding(padding:const  EdgeInsets.all(15),
             child:  Column(
              children:[
                const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                      CircleAvatar(
                  maxRadius: 50,
                  backgroundImage: AssetImage("images/sb.JPG"),
                  ),
                    SizedBox(height: 5),
                    Text("IEEE SB",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 2),
                    Text("ISET BIZERTE",style: TextStyle(fontSize: 15),)
                ]),),
                const SizedBox(height: 50,),
                Expanded(child: GridView.builder(
                      itemCount: 3,
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3) ,
                      itemBuilder: (context,index){
                            return Card(
                               child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(index==0 ? Icons.group : index==1 ? Icons.attach_money : Icons.money_off ,size: 30,color: Colors.blue,),
                                  const SizedBox(height: 20,),
                                 Text(index==0 ? Memebrs.toString() : index==1 ? payerNumber.toString() :NotpayerNumber.toString() ,style:const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),) 
                                ],
                               ),
                            );
                          }
                     )),
                     const Text("IEEE APP 2023"),
              ],
             ),
             )
       );
   }
}

import 'package:enhostels/screens/app_style.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}
    

class _ProfilescreenState extends State<Profilescreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Profile",style: TextStyle(color: Colors.black),),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
          ),
          onPressed: (){
            Navigator.of(context).pop();

          },
        ),
      ),
      body:SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          // child: StreamBuilder<Object>(
          //   stream: FirebaseFirestore.instance.collection('users').snapshots(),
          //   builder: (context,AsyncSnapshot snapshot){
          //     if(snapshot.hasData){
          //       var data = snapshot.data!.docs;
          //       return Column(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             SizedBox(height: 30,),
          //             Center(
          //               child: Container(
          //                 height: 130,
          //                 width: 130,
          //                 decoration: BoxDecoration(
          //                   shape: BoxShape.circle,
          //                   //borderRadius: BorderRadius.circular(150)
          //                 ),
          //                 child: ClipRRect(
          //                   borderRadius: BorderRadius.circular(150),
          //                   child: Image(
          //                     fit: BoxFit.cover,
          //                     image: NetworkImage("https://tse4.mm.bing.net/th?id=OIP.nwr1zYx-fJMcfAG7izIh4wHaGm&pid=Api&P=0"),
          //                     // loadingBuilder: (context,child, loadingProgress){
          //                     //   if(loadingProgress==Null){
          //                     //     return child;
          //                     //   }
          //                     //     return Center(child: CircularProgressIndicator(),);
                                
          //                     // },
          //                     errorBuilder: (context,object,Stack){
          //                       return Container(
          //                         child: Icon(Icons.error_outline,color: Colors.black,),
          //                       );
          //                     },
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             Text(
          //               data['name'],
          //               style: TextStyle(fontSize: 20.0),
          //             ),
          //           ]);
          //     }
              
          //   }
          // )
      ))     
    );
  }
}
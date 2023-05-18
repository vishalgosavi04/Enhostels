import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:enhostels/screens/app_style.dart';
import 'package:firebase_database/firebase_database.dart';

class showhostellist extends StatefulWidget {
  const showhostellist({super.key});

  @override
  State<showhostellist> createState() => _showhostellistState();
}

class _showhostellistState extends State<showhostellist> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('hostels');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGrey,
        title: Text("Hostels"),
        leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              })
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              query: ref , 
              
              itemBuilder: (context,snapshot,animation, index){
                var _image = snapshot.child('image').value.toString();
                return Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                    height: 150,
                    decoration: BoxDecoration(
                      color: kYellow,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    // child: ListTile(
                    //   title: Text(snapshot.child('name').value.toString()),
                    // ),
                    child: Expanded(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top:15),
                          margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Image.network(_image),
                          ),
                        // Text(_filteredOrphanageNames[orphanageIndex],
                        // style: TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 20,
                        //     fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.only(left:18.0, top:10, right: 20),
                          child: Column(
                              children: [
                                 Text(snapshot.child('name').value.toString(),style: TextStyle(fontSize: 20,color:kBlack,fontWeight: FontWeight.bold),),
                                 SizedBox(height: 5,),
                                  Text(snapshot.child('address').value.toString(),
                                          style: TextStyle(
                                          color:kBlack,
                                          fontSize: 18,
                                        )),
                  ],
                ),
              )
                      ],
                  
                                   ),
                  ),
                  ),
                );
              })
          )
        ],
      )
    );
  }
}
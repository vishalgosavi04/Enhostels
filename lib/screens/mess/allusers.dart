import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:enhostels/screens/app_style.dart';

import '../login.dart';

class allusers extends StatefulWidget {
  String id;
  allusers({Key? key, required this.id}) : super(key: key);

  @override
  State<allusers> createState() => _allusersState(id);
}

class _allusersState extends State<allusers> {
  String id;
  _allusersState(this.id);
  final currentuser = FirebaseAuth.instance.currentUser;
  final userid = FirebaseAuth.instance.currentUser!.uid;
  DatabaseReference databaseref = FirebaseDatabase.instance.ref("mess");
  late DatabaseReference newdbref= FirebaseDatabase.instance.ref("mess").child(id).child("menu");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGrey,
        title: Text("Menu"),
        leading:  IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        
      ),
      body: FirebaseAnimatedList(
            query: newdbref, 
            itemBuilder: (context,snapshot, Animation,index){
              
                return ListTile(
                title: Text(snapshot.child("item").value.toString()),
                subtitle: Text(snapshot.child("price").value.toString()),
                trailing: GestureDetector(
                  onTap: (){
                    newdbref.child(snapshot.child("id").value.toString()).remove();
                  },
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                    
                  ),
                ),
              );
              
              
            }
          ),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
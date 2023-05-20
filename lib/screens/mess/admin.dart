import 'package:enhostels/screens/app_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

import '../login.dart';

class admin extends StatefulWidget {
  String id;
  admin({Key? key, required this.id}) : super(key: key);


  @override
  State<admin> createState() => _adminState(id);
}

class _adminState extends State<admin> {
  String id;
  _adminState(this.id);
  final currentuser = FirebaseAuth.instance.currentUser;
  final userid = FirebaseAuth.instance.currentUser!.uid;
  DatabaseReference databaseref = FirebaseDatabase.instance.ref("mess");
  late DatabaseReference newdbref= FirebaseDatabase.instance.ref("mess").child(id).child("menu");
  TextEditingController itemcontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  String errormsg ="";
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

          // Container(
          //   alignment: Alignment.bottomRight,
            
          //   margin: EdgeInsets.only(bottom: 40,right: 20),
          //   child: 
          // ),
      

      floatingActionButton: FloatingActionButton(
              backgroundColor: kGrey,
              tooltip: "Add new item",
              onPressed:(){
                dialogPopup("Add a new item");
              } ,
              child: Icon(Icons.add),
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
  
     dialogPopup(String textmsg) {
      showDialog(
        context: context, 
        builder: (context){
          return StatefulBuilder(
            builder: (context,setStateDialog){
              return AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                scrollable: true,
                title: Text(textmsg,textAlign: TextAlign.center,),
                contentPadding: EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 20),
                content: Column(
                  children: [
                    SizedBox(
                      height: 45,
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: itemcontroller,
                        decoration: InputDecoration(
                          counterText: "",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kGrey,width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kBlack,width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 15,),
                    SizedBox(
                      height: 45,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: pricecontroller,
                        decoration: InputDecoration(
                          counterText: "",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kGrey,width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kBlack,width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: errormsg == ""?false:true,
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Text(errormsg,style: TextStyle(color: Colors.red),)
                        ],
                      )
                    ),
                    ElevatedButton(
                      onPressed: (){
                        setStateDialog((){
                          if(pricecontroller.text==""){
                            errormsg= "please enter a valid number ";
                          }
                          else if(pricecontroller.text=="0"){
                            errormsg= "You cannot use 0";
                          }
                          else{
                            errormsg= '';
                          }
                          String nid = DateTime.now().microsecondsSinceEpoch.toString();
                          databaseref.child(id).child("menu").child(nid).set({
                            "id":nid,
                            "item": itemcontroller.text.toString(),
                            "price": pricecontroller.text.toString()
                         });
                        });
                      },
                     child: Text("Add")
                     ),
                     TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      }, 
                      child: Text("cancel"))
                  ],
                ),
              );
            }
          
          );
        }
      
      );
     }
}
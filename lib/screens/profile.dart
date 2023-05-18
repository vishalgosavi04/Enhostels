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
  final currentuser = FirebaseAuth.instance.currentUser;
  String myemail='';
  String mobile='';
  String name= '';
   String image= '';
  
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
      body:Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: StreamBuilder<Object>(
            stream: FirebaseFirestore.instance.collection('users').where('uid',isEqualTo:currentuser!.uid ).snapshots(),
            builder: (context,AsyncSnapshot snapshot) {

             if(currentuser!=null){
             FirebaseFirestore.instance
            .collection("users")
            .doc(currentuser!.uid)
            .get()
            .then((ds) {
              Map<dynamic, dynamic> userData = ds.data() as Map<dynamic, dynamic>;
               myemail= userData['email'];
               name= userData['name'];
               mobile= userData['mobile'];
               image = userData['image'];
               setState(() {
                 
               });
              }).catchError((e){
            print(e);
            });
              if(myemail!=null && name!= null&& mobile!=null&&image!=null){
                   return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30,),
                      Center(
                        child: Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            //borderRadius: BorderRadius.circular(150)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(150),
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://tse1.mm.bing.net/th?id=OIP.7PsWAogh67GuINH1j_YjXwHaHa&pid=Api&P=0"),
                              loadingBuilder: (context,child, loadingProgress){
                                if(loadingProgress !=Null){
                                  return child;
                                }
                                  return Center(child: CircularProgressIndicator(),);
                                
                              },
                              errorBuilder: (context,object,Stack){
                                return Container(
                                  child: Icon(Icons.error_outline,color: Colors.black,),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("Name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                      SizedBox(height: 5,),
                      Container(
                        //margin: EdgeInsets.only(top:20),
                        padding: EdgeInsets.only(left: 5),
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                        ),
                        child: Text(
                          name,
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Text("Email",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      Container(
                        //margin: EdgeInsets.only(top:20),
                        padding: EdgeInsets.only(left: 5),
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                        ),
                        child: Text(
                          myemail,
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Text("Mobile",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                      SizedBox(height: 5,),
                      Container(
                        //margin: EdgeInsets.only(top:20),
                        padding: EdgeInsets.only(left: 5),
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                        ),
                        child: Text(
                          mobile,
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ]);
               }
              else{
               return Text("loading");
              }
            }
            else{
              return Text("error occured");
            }
          }
      ))     
    ));
  }

  
}
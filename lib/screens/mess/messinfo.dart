import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:enhostels/screens/app_style.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:enhostels/screens/mess/admin.dart';
import 'package:enhostels/screens/mess/allusers.dart';
import 'package:url_launcher/url_launcher_string.dart';

class messinfo extends StatefulWidget {
  //const Hostelinfo({super.key,});
   String name,address,image,mobile,locationUrl,id;
   messinfo({Key? key, required this.name, required this.address, required this.image,required this.mobile,required this.locationUrl,required this.id}) : super(key: key);
  
  @override
  State<messinfo> createState() => _messinfoState(name,address, image,mobile,locationUrl,id);
}

class _messinfoState extends State<messinfo> {
  String name,address,image,mobile,locationUrl,id;
  _messinfoState(this.name,this.address,this.image,this.mobile,this.locationUrl,this.id);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kGrey,
          title: const Text('Mess Details'),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }
          )
      ),
      body: Container(
        padding: EdgeInsets.only(top:15),
        child: Column(
          children: [
            Row(
              children: [
                
                Container(
                margin: EdgeInsets.only(top: 30, left: 20, right: 15),
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:kBlack,
                ),
                
               child: Center(child: Image.network(image)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(name,style: TextStyle(fontSize: 20,color:kBlack,fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Text(address,
                              style: TextStyle(
                                  color:kBlack,
                                  fontSize: 15,
                                  )),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                          Text(" Rating :  ",style: TextStyle(fontSize: 15,color:kBlack,fontWeight: FontWeight.w400),),
                          Icon(Icons.star,size: 20,),
                          Icon(Icons.star,size: 20,),
                          Icon(Icons.star,size: 20,),
                          Icon(Icons.star,size: 20,),
                          Icon(Icons.star_half,size: 20,)
                      ],
                    )
                    
                  ],
                ),
              )
              ],
            ),
            SizedBox(height: 40,),
            GestureDetector(
              onTap: () async {
                final Uri url = Uri(
                  scheme: 'tel',
                  path: mobile,
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  print('cannot launch this url');
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color:kGreen,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.call, color:kYellow),
                    const SizedBox(width: 10),
                    Text(
                      'Call +91$mobile',
                      style: TextStyle(fontSize: 18, color:kYellow),
                    ),
                  ],
                ),
              ),
            ),

            // Location link
            const SizedBox(height: 25),
            GestureDetector(
              onTap: () async {
                if(canLaunchUrlString(locationUrl)!= null) {
                  await launchUrlString(locationUrl);
                } 
                else{
                  throw "could not launch $locationUrl";
                } 
              },

              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color:kRed,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, color:kYellow),
                    const SizedBox(width: 10),
                    Text(
                      'View Location',
                      style: TextStyle(fontSize: 18, color:kYellow),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25,),
            GestureDetector(
              onTap: () {
                _route();


                //Navigator.push(context, MaterialPageRoute(builder: (context)=>HostelListScreen()));
              },

              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color:kGreen,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.food_bank, color:kYellow),
                    const SizedBox(width: 10),
                    Text(
                      'Check Menu ',
                      style: TextStyle(fontSize: 18, color:kYellow),
                    ),
                  ],
                ),
              ),
            ),
            
          ],
        )
      ),
    );
  }
  void _route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('rool') == "Owner") {
           Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  admin(id:id,),
          ),
        );
        }else{
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  allusers(id: id,),
          ),
        );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  
  }
}
import 'package:enhostels/screens/app_style.dart';
import 'package:enhostels/screens/hostellist.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enhostels/screens/admin.dart';
import 'package:enhostels/screens/allusers.dart';

class Messinfopage1 extends StatefulWidget {
  const Messinfopage1({super.key});

  @override
  State<Messinfopage1> createState() => _Messinfopage1State();
}

class _Messinfopage1State extends State<Messinfopage1> {
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
                  color: kBlack,
                ),
                
               child: Center(child: Image.asset('assets/images/hostel1.jpg')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(" Aman Hotel ",style: TextStyle(fontSize: 20,color: kBlack,fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Text("Dighi, Pune ,\n Maharashtra -411015",
                              style: TextStyle(
                                  color: kBlack,
                                  fontSize: 15,
                                  )),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                          Text(" Rating :  ",style: TextStyle(fontSize: 15,color: kBlack,fontWeight: FontWeight.w400),),
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
                // final Uri url = Uri(
                //   scheme: 'tel',
                //   path: "885 683 2824",
                // );
                // if (await canLaunchUrl(url)) {
                //   await launchUrl(url);
                // } else {
                //   print('cannot launch this url');
                // }
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: kRed,
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
                      'Call +918856832824',
                      style: TextStyle(fontSize: 18, color: kYellow),
                    ),
                  ],
                ),
              ),
            ),

            // Location link
            const SizedBox(height: 25),
            GestureDetector(
              onTap: () async {
                // var url = Uri.parse(
                //     'https://www.google.com/maps/place/Dnyandeep+Balgruha/@18.623014,73.8680463,15z/data=!4m6!3m5!1s0x3bc2c70a82e7be9d:0xea151d5f8315cad7!8m2!3d18.623014!4d73.8680463!16s%2Fg%2F11g6bskpn8?hl=en-US');
                // // ignore: deprecated_member_use
                // if (await canLaunchUrl(url)) {
                //   // ignore: deprecated_member_use
                //   await launchUrl(url);
                // } else {
                //   throw 'Could not launch $url';
                // }
              },

              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: kBlue,
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
            SizedBox(height: 30,),

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
            builder: (context) =>  admin(),
          ),
        );
        }else{
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  allusers(),
          ),
        );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  
  }
}
import 'package:flutter/material.dart';
import 'dart:async';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:help_out/screens/home_screen.dart';
// import 'package:help_out/screens/first_screen.dart';
// import 'package:help_out/screens/sign_up_screen.dart';
// import 'package:help_out/screens/aboutus.dart';
//import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:help_out/screens/contactus.dart';
//import 'package:url_launcher/url_launcher.dart';

class HostelInfoPage1 extends StatelessWidget {
  const HostelInfoPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Details'),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              })),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Expanded
            (
              child: Row(
                children: [
                  Container(
                margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                height: 200,
                width: double.infinity,
                color: Colors.grey[300],
                child: Center(child: Image.asset('assets/images/dnyandeep.jpg')),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dnyandeep Balgruha',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Text("Address : Dighi, Pune , Maharashtra -411015",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold))),
                    const SizedBox(height: 10),
                    // Text(
                    //   'An orphanage taking care of over 70 orphans by funding their basic needs and primary education',
                    //   style: TextStyle(fontSize: 16),
                    // ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
                ],
              ),
            ),
            
            //const SizedBox(height: 20),
            // Text placeholders
            
           // const SizedBox(height: 20),
            // Phone number
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
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.call, color: Colors.white),
                    const SizedBox(width: 10),
                    Text(
                      'Call +918856832824',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),

            // Location link
            const SizedBox(height: 15),
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
                  color: Color.fromARGB(255, 194, 43, 86),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, color: Colors.white),
                    const SizedBox(width: 10),
                    Text(
                      'View Location',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            // Container(
            //     //margin: EdgeInsets.symmetric(horizontal: 15),
            //     width: double.infinity,
            //     padding: const EdgeInsets.symmetric(horizontal: 20),
            //     child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           // Container(
            //           //     decoration: BoxDecoration(
            //           //       color: Colors.orange,
            //           //       borderRadius: BorderRadius.circular(10),
            //           //     ),
            //           //     padding: const EdgeInsets.symmetric(
            //           //         vertical: 10, horizontal: 20),
            //           //     child: Row(
            //           //         mainAxisAlignment: MainAxisAlignment.center,
            //           //         children: [
            //           //           Icon(Icons.monetization_on,
            //           //               color: Colors.white),
            //           //           const SizedBox(width: 10),
            //           //           Text('Donate'),
            //           //         ])),
                      
            //         ]))
          ],
        ),
      ),
    );
  }
}
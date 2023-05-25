import 'package:flutter/material.dart';
import 'package:enhostels/screens/home.dart';
import 'package:enhostels/screens/register.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_navigatetohome();
    Timer(Duration(seconds: 5), () {
      if(_auth.currentUser==null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Register()));
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(child:
        Image.asset("assets/images/splash_screen_2.png",height: 200,width: 200,))
    );
  }
}
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body :  Center(
//           child: Container(
//
//             alignment: Alignment.center,
//             //height: 400,
//             //width: 400,
//             margin: EdgeInsets.only(top: 320),
//             color: Colors.white,
//             child: Column(
//               children: [
//                 Container(
//
//                     height: 150,
//                     width: 150,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.blue,
//
//                     ),
//
//                     child: Padding(
//                       padding: const EdgeInsets.all(22.0),
//                       child: Image.asset( "assets/images/Final.png",fit: BoxFit.scaleDown,height: 50,width: 50,),
//                     )
//                 ),
//                 SizedBox(height: 20,),
//                 Text("ENHOSTELS",style: TextStyle(fontSize: 25,color: Colors.black))
//               ],
//             ),
//           ),
//         )
//     );
//   }
// }

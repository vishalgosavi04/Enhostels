import 'package:enhostels/screens/hostel_info.dart';
import 'package:enhostels/screens/hostels/hostelinfo.dart';
import 'package:flutter/material.dart';
import 'package:enhostels/screens/app_style.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:enhostels/screens/hostelinfo1.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

// import 'package:help_out/screens/infopage1.dart';
// import 'package:help_out/screens/infopage2.dart';
// import 'package:help_out/screens/infopage3.dart';
// import 'package:help_out/screens/infopage4.dart';
// import 'package:help_out/screens/infopage5.dart';
// import 'package:help_out/screens/infopage6.dart';
// import 'package:help_out/screens/infopage7.dart';
// import 'package:help_out/screens/infopage8.dart';

class HostelListScreen extends StatefulWidget {
  @override
  _HostelListScreenState createState() => _HostelListScreenState();
}

class _HostelListScreenState extends State<HostelListScreen> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('hostels');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kGrey,
          // title: Text("HelpOut",
          //     style: TextStyle(
          //         color: Colors.white,
          //         fontStyle: FontStyle.normal,
          //         fontSize: 26.0)),
          title: Text("Hostels"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              })),
      body: FirebaseAnimatedList(
        query: ref,
        itemBuilder: (context,snapshot,animation, index) {
          var _image = snapshot.child('image').value.toString();
          var _name = snapshot.child('name').value.toString();
          var _address = snapshot.child('address').value.toString();
          var mobile= snapshot.child('mobile').value.toString();
          var fac1= snapshot.child('facility1').value.toString();
          var fac2= snapshot.child('facility2').value.toString();
          var fac3= snapshot.child('facility3').value.toString();
          var fac4= snapshot.child('facility4').value.toString();
          var fac5= snapshot.child('facility5').value.toString();
          var locationurl= snapshot.child("locationurl").value.toString();
          final HostelIndex = index;
          return Container(
            padding: const EdgeInsets.only(top: 15.0),
            margin: EdgeInsets.only(left: 15, right: 15, top: 20),
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              //color: Color.fromARGB(255, 203, 31, 31)
            ),
            child: GestureDetector(
                onTap: () {
                  // Navigate to the page for the selected orphanage
                  // _navigateToHostelDetailsScreen(
                  //     _filteredHostelNames[HostelIndex]);
                   Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => Hostelinfo(name: _name,address:_address,image: _image,mobile: mobile,facility1: fac1,facility2: fac2,facility3: fac3,facility4: fac4,facility5: fac5,locationUrl: locationurl),
                  ),
    );
                },
                child: Container(
                  //padding: EdgeInsets.only(top: 30, left: 80),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: kYellow,
                      borderRadius: BorderRadius.circular(5)),
                  child: Expanded(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Image.network(_image)
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
                                        ))
                  ],
                ),
              )
                      ],
                  
                                   ),
                  )
                 )),
          );
        },
      ),
    );
  }
}
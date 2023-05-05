import 'package:flutter/material.dart';
import 'package:enhostels/screens/app_style.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:enhostels/screens/hostelinfo1.dart';
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

  Map<String, Widget> _HostelPages = {
    "Aman Boy's Hostel": Hostelinfopage(),
     'sujay hostel ': Hostelinfopage(),
    // 'Jeeva Jyothi trust': InfoPage3(),
    // 'Nachiket Balgram': InfoPage4(),
    // 'Vriddh Anand Ashram': InfoPage5(),
    // 'Adarana Charitable trust': InfoPage6(),
    // 'shanti sahyog old age home': InfoPage7(),
    // 'Naad Foundation': InfoPage8()
  };
  List<String> _images=[
    'assets/images/hostel1.jpg',
    'assets/images/hostel2.jpg',


  ];
  List<String> _HostelNames = [
    "Aman Boy's Hostel",
     'Sujay Hostel',
    // 'Jeeva Jyothi trust',
    // 'Nachiket Balgram',
    // 'Vriddh Anand Ashram',
    // 'Adarana Charitable trust',
    // 'shanti sahyog old age home',
    // 'Naad Foundation'
  ];

  List<String> _address = [
    "Akurdi, Pune",
    "Akurdi, Pune",

  ];


  List<String> _filteredHostelNames = [];
  List<String> _filteredimages=[];
  List<String> _filteredaddress =[];
  @override
  void initState() {
    super.initState();
    _filteredHostelNames = _HostelNames;
    _filteredimages =_images;
    _filteredaddress= _address;
  }

  void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
      _filteredHostelNames = _HostelNames
          .where(
              (name) => name.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    });
  }

  void _navigateToHostelDetailsScreen(String HostelName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _HostelPages[HostelName]!,
      ),
    );
    }
    

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
          title: TextField(
            controller: _searchController,
            onChanged: _updateSearchQuery,
            decoration: InputDecoration(
                hintText: 'Search ...',
                border: InputBorder.none,
                hintStyle: TextStyle(color:kBlack, fontSize: 18)),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              })),
      body: ListView.builder(
        itemCount: _filteredHostelNames.length,
        itemBuilder: (BuildContext context, int index) {
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
                  _navigateToHostelDetailsScreen(
                      _filteredHostelNames[HostelIndex]);
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
                          child: Image.asset(_filteredimages[HostelIndex])),
                        // Text(_filteredOrphanageNames[orphanageIndex],
                        // style: TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 20,
                        //     fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.only(left:18.0, top:10, right: 20),
                          child: Column(
                              children: [
                                 Text(_filteredHostelNames[HostelIndex],style: TextStyle(fontSize: 20,color:kBlack,fontWeight: FontWeight.bold),),
                                 SizedBox(height: 5,),
                                  Text(_filteredaddress[HostelIndex],
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
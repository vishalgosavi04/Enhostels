import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
class addhostel2 extends StatefulWidget {
  const addhostel2({super.key});

  @override
  State<addhostel2> createState() => _addhostel2State();
}

class _addhostel2State extends State<addhostel2> {
  final databaseref = FirebaseDatabase.instance.ref('hostels');
  final namecontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
  final fac1controller = TextEditingController();
  final fac2controller = TextEditingController();
  final fac3controller = TextEditingController();
  final fac4controller = TextEditingController();
  final fac5controller = TextEditingController();
  late String lat;
  late String long;
  late String googleurl;
  var newurl;
  bool loading = false;
  File? _image;
  final picker = ImagePicker();
  firebase_storage.FirebaseStorage storage= firebase_storage.FirebaseStorage.instance;
  Future getImageGallery() async {
    final pickedfile = await picker.pickImage(source: ImageSource.gallery,imageQuality: 80);
    setState(() {
      if(pickedfile!= null){
        _image= File(pickedfile.path);
      }
      else{
        print("no image picked");
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Add Hostel "),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            
              // SizedBox(height: 30,),
              // ElevatedButton(onPressed: (){
              //   _openmap(lat,long);
              // }, 
              // child: Text("get location")),
              
              
              SizedBox(height:30),
            InkWell(
              onTap: (){
                getImageGallery();
              },
              child: Center(
                child: Container(
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black
                    )
                  ),
                  child: _image!= null ? Image.file(_image!.absolute):
                  Center(child: Icon(Icons.image)),
                ),
              ),
            ),
            SizedBox(height:30),
            TextFormField(
              controller: namecontroller,
              decoration: InputDecoration(
                hintText: "Enter the name ",
              ),
            ),
            SizedBox(height:30),
            TextFormField(
              controller: addresscontroller,
              decoration: InputDecoration(
                hintText: "Enter the Address ",
              ),
            ),
            SizedBox(height:30),
            TextFormField(
              controller: mobilecontroller,
              decoration: InputDecoration(
                hintText: "Enter the Mobile no. ",
              ),
            ),
           
            SizedBox(height:30),
            TextFormField(
              controller: fac1controller,
              decoration: InputDecoration(
                hintText: "Enter the 1 facility ",
              ),
            ),
            SizedBox(height:30),
            TextFormField(
              controller: fac2controller,
              decoration: InputDecoration(
                hintText: "Enter the 2 facility ",
              ),
            ),
            SizedBox(height:30),
            TextFormField(
              controller: fac3controller,
              decoration: InputDecoration(
                hintText: "Enter the 3 facility ",
              ),
            ),
            SizedBox(height:30),
            TextFormField(
              controller: fac4controller,
              decoration: InputDecoration(
                hintText: "Enter the 4 facility ",
              ),
            ),
            SizedBox(height:30),
            TextFormField(
              controller: fac5controller,
              decoration: InputDecoration(
                hintText: "Enter the 5 facility ",
              ),
            ),
            SizedBox(height:30),
            GestureDetector(
              onTap: (){
                _getcurrentlocation().then((value) => {
                  lat = "${value.latitude}",
                  long = "${value.longitude}",
                  googleurl = 'https://www.google.com/maps/search/?api=1&query=$lat,$long',   
                });
              }, 
              child: Container(
                height: 35,
                padding: EdgeInsets.only(left:120,top: 5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text("Get the location",style: TextStyle(color: Colors.white,fontSize: 16),)
              )
              ),
            
            SizedBox(height:30),
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    loading= true;
                  });
                  firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref('/hostel/'+ DateTime.now().microsecondsSinceEpoch.toString());
                  firebase_storage.UploadTask uploadTask= ref.putFile(_image!.absolute);
                  Future.value(uploadTask).then((value) async=> {
                     newurl = await ref.getDownloadURL(),


                    databaseref.child(DateTime.now().millisecondsSinceEpoch.toString()).set({
                    "name": namecontroller.text.toString(),
                    "mobile": mobilecontroller.text.toString(),
                    "address": addresscontroller.text.toString(),
                    "image": newurl.toString(),
                    "facility1":fac1controller.text.toString(),
                    "facility2":fac2controller.text.toString(),
                    "facility3":fac3controller.text.toString(),
                    "facility4":fac4controller.text.toString(),
                    "facility5":fac5controller.text.toString(),
                    "locationurl":googleurl,
                    
                    }).then((value) => {
                    setState(() {
                    loading= false;
                  })
                  }).onError((error, stackTrace) => {
                    setState(() {
                    loading= false;
                  })
                  })
                  }).onError((error, stackTrace) => {
                  });
                
                  
                }, 
                child: Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left:58.0,top: 8),
                    child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                  ))
                
                ),
            )
          ]), 
      ),
    );
  }
  
  Future<Position> _getcurrentlocation() async{
    bool serviceenabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceenabled){
      return Future.error("Location services are disabled. ");
    }

    LocationPermission permission= await Geolocator.checkPermission();
    if(permission== LocationPermission.denied){
      permission= await Geolocator.requestPermission();
      if(permission== LocationPermission.denied){
        return Future.error("Location Permission are Denied. ");
      }
    }
    if(permission== LocationPermission.deniedForever){
      return Future.error("Location permission are permanently denied");
    }
    return await Geolocator.getCurrentPosition();

  }
  
  Future<void> _openmap(String latitude, String longitude) async{
String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';   
  if(canLaunchUrlString(googleurl)!= null) {
    await launchUrlString(googleurl);
  } 
  else{
    throw "could not launch $googleurl";
  } 
  }
}
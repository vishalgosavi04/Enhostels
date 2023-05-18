import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
class addmess extends StatefulWidget {
  const addmess({super.key});

  @override
  State<addmess> createState() => _addmessState();
}

class _addmessState extends State<addmess> {
  final databaseref = FirebaseDatabase.instance.ref('mess');
  final namecontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
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
        title: Text("Add Mess "),
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
                    "image": newurl.toString()
                    
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
}
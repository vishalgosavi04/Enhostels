import 'package:flutter/material.dart';
import 'package:enhostels/screens/app_style.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Hostelinfo extends StatefulWidget {
  //const Hostelinfo({super.key,});
   String name,address,image,mobile,facility1,facility2,facility3,facility4,facility5,locationUrl;
   Hostelinfo({Key? key, required this.name, required this.address, required this.image,required this.mobile,required this.facility1,required this.facility2,required this.facility3,required this.facility4,required this.facility5,required this.locationUrl}) : super(key: key);
  
  @override
  State<Hostelinfo> createState() => _HostelinfoState(name,address, image,mobile,facility1,facility2,facility3,facility4,facility5,locationUrl);
}

class _HostelinfoState extends State<Hostelinfo> {
  String name,address,image,mobile,facility1,facility2,facility3,facility4,facility5,locationUrl;
  _HostelinfoState(this.name,this.address,this.image,this.mobile, this.facility1, this.facility2, this.facility3, this.facility4, this.facility5,this.locationUrl);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kGrey,
          title: const Text('Hostel Details'),
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
            Text("Facilities Provided", style: TextStyle(color: kBlack,fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 15,),

            Text(facility1,style: TextStyle(color: kBlack,fontSize: 18,fontWeight: FontWeight.w500),),
            SizedBox(height: 15,),

            Text(facility2,style: TextStyle(color:kBlack,fontSize: 18,fontWeight: FontWeight.w500),),
            SizedBox(height: 15,),

            Text(facility3,style: TextStyle(color:kBlack,fontSize: 18,fontWeight: FontWeight.w500),),
            SizedBox(height: 15,),

            Text(facility4,style: TextStyle(color:kBlack,fontSize: 18,fontWeight: FontWeight.w500),),
            SizedBox(height: 15,),
            Text(facility5,style: TextStyle(color:kBlack,fontSize: 18,fontWeight: FontWeight.w500),),

            
          ],
        )
      ),
    );
  }
}
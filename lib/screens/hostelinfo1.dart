import 'package:flutter/material.dart';
class Hostelinfopage extends StatefulWidget {
  const Hostelinfopage({super.key});

  @override
  State<Hostelinfopage> createState() => _HostelinfopageState();
}

class _HostelinfopageState extends State<Hostelinfopage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
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
                  color: Colors.black,
                ),
                
               child: Center(child: Image.asset('assets/images/hostel1.jpg')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(" Aman Boy's Hostel ",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Text("Dighi, Pune ,\n Maharashtra -411015",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  )),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                          Text(" Rating :  ",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w400),),
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
                  color: Colors.blue,
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
            SizedBox(height: 25,),
            Text("Facilites Provided", style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 15,),

            Text("1.  24 hrs water",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
            SizedBox(height: 15,),

            Text("1.  24 hrs water",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
            SizedBox(height: 15,),

            Text("1.  24 hrs water",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
            SizedBox(height: 15,),

            Text("1.  24 hrs water",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
            SizedBox(height: 15,),
            Text("1.  24 hrs water",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),

            
          ],
        )
      ),
    );
  }
}
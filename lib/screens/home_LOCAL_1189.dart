import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enhostels/screens/app_style.dart';
import 'package:enhostels/screens/hostels/hostellist.dart';
import 'package:enhostels/screens/messllist.dart';
import 'package:enhostels/screens/main_copy.dart';
import 'package:enhostels/screens/profile.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final _auth = FirebaseAuth.instance;

  void _onItemTapped(int index){
    setState(() {
    _selectedIndex = index;
  
  });
      switch(index){
        case 0:
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          break;
        case 1:
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MessListScreen()));
          break;
        case 2:
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HostelListScreen()));
          break;
        case 3:
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Profilescreen()));
          break;
     }
  }

  User? user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: kYellow,
        appBar: _appbar(),
        body: _bodyofscreen(context),
        drawer: _drawer(context),
        bottomNavigationBar:
        Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: kBlack,
                blurRadius: 10,
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              height:70,
              child: BottomNavigationBar(
                elevation: 50,
                backgroundColor: kYellow,
                items:[
                  BottomNavigationBarItem(
                    backgroundColor: kYellow,
                    icon: _selectedIndex==0?
                  Image.asset('assets/images/home2.png',height: 40,width: 40,):
                  Image.asset('assets/images/home2.png',height: 40,width: 40,),
                    label:'',
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: kYellow,
                    icon: _selectedIndex==1?
                    Image.asset('assets/images/meal.png',height: 40,width: 40,):
                    Image.asset('assets/images/meal.png',height: 40,width: 40,),
                    label:'',
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: kYellow,
                    icon: _selectedIndex==2?
                    Image.asset('assets/images/bed.png',height: 40,width: 40,):
                    Image.asset('assets/images/bed.png',height: 40,width: 40,),
                    label:'',
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: kYellow,
                    icon: _selectedIndex==3?
                    Image.asset('assets/images/user.png',height: 40,width: 40,):
                    Image.asset('assets/images/user.png',height: 40,width: 40,),
                    label:'',
                  ),
                ],
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
              ),
            ),
      ),
        ),

      );
    }
  
  _appbar() {
    return AppBar(
      backgroundColor: kYellow,
      iconTheme: IconThemeData(color: kBlack),
      title: GestureDetector(
        onTap: (){
          print("search clicked");
        },
        child: Container(
          margin: EdgeInsets.only(left: 300),
          child: Icon(
            Icons.search_outlined,
          ),
        ),
      ) ,
    );
  }
}

Drawer _drawer(BuildContext context) {

  return Drawer(
    backgroundColor: kYellow,
    surfaceTintColor: kBlack,
    child: ListView(
      children: [
        StreamBuilder(
          stream: FirebaseFirestore.instance.collection("users").snapshots(),
          builder: (context ,AsyncSnapshot<QuerySnapshot> snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                itemBuilder: (context,i){
                var data = snapshot.data!.docs[i];

                return UserAccountsDrawerHeader(accountName: Text(data['name']), accountEmail: Text(data['email']));
              });
            }else{
              return CircularProgressIndicator();
            }
          }
          
          
        )
      ],
    ),
    
  );
}

Widget _bodyofscreen(BuildContext context) {
  return SafeArea(
      child: ListView(
        children:[
          const SizedBox(
            height:40,
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: kPaddingHorizontal,
          //     vertical: 15.0,
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       SvgPicture.asset('assets/images/icons8-menu-48.svg',
          //         height: 30, width: 30,),
          //       SvgPicture.asset('assets/images/search.svg',height: 30, width: 30,),
          //     ],
          //   ),
          // ),
          // const SizedBox(
          //     height:0
          // ),
          SizedBox(
            height: 210,
            child: Stack(
              children: [
                //Welcome Box
                Positioned(
                  left:0,
                  top: 0,
                  right: 0,
                  bottom: 0,
                  child:Image.asset(
                    'assets/images/asset_1_2.png',
                  ),
                ),
                //Logo
                // Positioned(
                //   left: 20,
                //   right: 230,
                //   top: 20,
                //   bottom:20,
                //   child: Image.asset('assets/images/Final_black.png'),
                // ),
                //Welcome Text
                Positioned(
                    left: 140,
                    right: 0,
                    top: 0,
                    bottom:120,
                    child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Text('Welcome to',style:kSourceSansProBold.copyWith(
                            fontSize: 23,
                          )),
                        ]
                    )
                ),
                Container(
                  margin: EdgeInsets.only(left:5,top:50),
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/Button.png',
                      height: 270,
                      width: 270,
                      fit: BoxFit.cover),
                ),
                // Positioned(
                //   left: 180,
                //   right: 20,
                //   top:80,
                //   bottom: 0,
                //   child:Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children:[
                //         Text('',style:kSourceSansProMedium.copyWith(
                //           fontSize:15,
                //         )),
                //       ]
                //   ),
                // ),
                // Positioned(
                //   left:0,
                //   top: 200,
                //   right: 0,
                //   bottom: 0,
                //   child:Image.asset(
                //     'assets/images/asset_1.png',
                //   ),
                // ),
              ],
            ),
          ),
          // const SizedBox(
          //     height:5
          // ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left:18,top:10),
                alignment: Alignment.center,
                child: Image.asset('assets/images/dorm.png',
                    height: 160,
                    width: 144,
                    fit: BoxFit.cover),
              ),
              Container(
                margin: EdgeInsets.only(right:18,top:10),
                alignment: Alignment.center,
                // height: 100,
                // width: 100,
                child: Image.asset('assets/images/dcanteen.png',
                    height: 160,
                    width: 144,
                    fit: BoxFit.cover),
              ),
            ],
          ),
          const SizedBox(
              height:0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>HostelListScreen()));
                },
                child: Container(
                  margin: EdgeInsets.only(left:15,top:20),
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/dorm_button.png',
                      height: 50,
                      width: 155,
                      fit: BoxFit.cover),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>MessListScreen()));
                },
                child: Container(
                  margin: EdgeInsets.only(right:15,top:20),
                  alignment: Alignment.center,
                  // height: 100,
                  // width: 100,
                  child: Image.asset('assets/images/food_button.png',
                      height: 50,
                      width: 155,
                      fit: BoxFit.cover),
                ),
              ),
            ],
          )

        ],
      ),
    );
}
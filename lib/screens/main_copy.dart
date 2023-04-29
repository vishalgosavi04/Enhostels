import 'package:enhostels/screens/app_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:enhostels/screens/home.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'ENHOSTELS',
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: kYellow,
        body: HomeScreen(),
        bottomNavigationBar: SingleChildScrollView(
          child: SizedBox(
            height:70,
            child: BottomNavigationBar(
              backgroundColor: kYellow,
              items:[
                BottomNavigationBarItem(
                  backgroundColor: kYellow,
                  icon: _selectedIndex==0?
                  Image.asset('assets/images/home.png',height: 40,width: 40,):
                  Image.asset('assets/images/home.png',height: 40,width: 40,),
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
    );//Material App
  }
}
import 'dart:async';
import 'package:enhostels/screens/splashscreen.dart';
import 'package:enhostels/screens/home.dart';
import 'package:enhostels/screens/hostel_info.dart';
import 'package:enhostels/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:enhostels/screens/hostel_info.dart';
import 'package:enhostels/screens/hostelinfo1.dart';
import 'package:enhostels/screens/hostels/hostellist.dart';
import 'package:enhostels/screens/messllist.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:enhostels/screens/register.dart';
import 'package:enhostels/screens/app_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:enhostels/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:enhostels/screens/profile2.dart';
import 'package:enhostels/screens/hostels/showhostellist.dart';
import 'package:enhostels/screens/hostels/addhostel2.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
      title: 'ENHOSTELS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: splash_screen()
      );
  }
  
  
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

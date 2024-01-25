import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'DialogHelper.dart';
import 'HomePage.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBJqx-aDkIsffx1zxH46_szBnJhQ9V3uo8",
      authDomain: "bayrak-web.firebaseapp.com",
      databaseURL: "https://bayrak-web-default-rtdb.firebaseio.com",
      projectId: "bayrak-web",
      storageBucket: "bayrak-web.appspot.com",
      messagingSenderId: "275346418236",
      appId: "1:275346418236:web:fd0bf2e15d56ef6c7d3139",),);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: DialogHelper.navigatorKey,
      title: 'Bayrak\'s Catering',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wassup/pages/home/home.dart';
import 'package:wassup/pages/landing.dart';
import 'package:wassup/pages/auth/login.dart';
import 'package:wassup/pages/auth/register.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
    debugShowCheckedModeBanner: false,
     initialRoute: '/',
     routes: {
       '/': (context) => const Landing(),
       '/getStarted': (context) =>  Register(), // Example route for navigation
       '/login': (context) => Login(),
       '/home' : (context) => const Home(),
     },
    );
  
  }
}

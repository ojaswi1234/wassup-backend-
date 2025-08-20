import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wassup/pages/landing.dart';
import 'package:wassup/pages/profile/login.dart';


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
       '/getStarted': (context) =>  Login() // Example route for navigation
     },
    );
  
  }
}

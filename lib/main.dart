import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wassup/pages/auth/loginPhone.dart';
import 'package:wassup/pages/auth/registerPhone.dart';
import 'package:wassup/pages/chat/chatArea.dart';
import 'package:wassup/pages/home/home.dart';
import 'package:wassup/pages/landing.dart';
import 'package:wassup/pages/auth/login.dart';
import 'package:wassup/pages/auth/register.dart';
import 'package:supabase_flutter/supabase_flutter.dart';




Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Supabase.initialize(
    url: 'https://hkxvlihyacqpfdviyycy.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhreHZsaWh5YWNxcGZkdml5eWN5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTU4OTQxMzksImV4cCI6MjA3MTQ3MDEzOX0.vQDz72Zu6IVglI43t2VUTYVxzeMZbBPRki9zm4_VxF8',
  );
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
       '/home' : (context) => Home(),
       '/chat' : (context) => ChatArea(),
       '/registerPhone' : (context) => RegisterPhone(),
       '/loginPhone' : (context) => LoginPhone(),
     },
    );
  
  }
}

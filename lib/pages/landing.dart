import 'package:flutter/material.dart';


class Landing extends StatelessWidget {
  const Landing({
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        gradient: const LinearGradient(
        colors: [Colors.green, Colors.black, Colors.yellow],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        
        ),
      ),
        child: Center(

        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Image.asset(
            'assets/images/removebg.png',
            width: 300,
            height: 300,
                     
          ),
          const SizedBox(height: 20),
          const Text("Welcome to ChatX", style: TextStyle(color: Colors.white, fontFamily: 'EduNSWACTCursive', fontSize: 35, fontWeight: FontWeight.bold, decoration: TextDecoration.none)),
         const SizedBox(height: 30),
          const Text("A place to connect with friends", style: TextStyle(color: Colors.white, fontSize: 12, decoration: TextDecoration.none)),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // Navigate to the next screen or perform an action
              Navigator.pushNamed(context, '/getStarted');
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, ),
            ),
            child: const Text("Get Started"),
          ),
          
         ],
        ),

        ),       
        );
    
  }
}
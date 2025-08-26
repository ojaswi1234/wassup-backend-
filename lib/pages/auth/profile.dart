import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow,
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF1E1E1E),
         
          borderRadius: BorderRadius.circular(12.0),
        ),
        alignment: Alignment.topCenter,
       child: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(
                'Wassup ??',
                style: TextStyle(color: Colors.white, fontSize: 24, decoration: TextDecoration.none),
              ),
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/profile.png')
              ),
            ],
          ),
        ),
      )
      )
      )
    );
    
  }
}
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Wassup ?', style: TextStyle(
          color: Colors.white,
          fontFamily: 'EduNSWACTCursive',
          fontSize: 22,
          fontWeight: FontWeight.bold,
        )),
        backgroundColor: const Color.fromARGB(255, 12, 20, 23),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings, color: Colors.white),
          onPressed: () {
            // Handle logout action
            Navigator.pushNamed(context, '/login');
          },
        ),
        
      ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 12, 20, 23),
        items: const <BottomNavigationBarItem>[
        
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, color: Colors.white),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.white),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group, color: Colors.white),
            label: 'Communities',
          ),
        ],
        
        unselectedItemColor: Colors.white60,
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          color: Colors.white60,
        ),
        selectedItemColor: Colors.yellow,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.green, Colors.black, Colors.yellow],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              
            ],
          ),
        ),
      ),
    );
  }
}
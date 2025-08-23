import 'package:flutter/material.dart';

class ChatArea  extends StatelessWidget {
  const ChatArea ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with Alex', style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),),
        leadingWidth: 72,
        elevation: 10,
        shadowColor: Colors.white38,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert_outlined, color: Colors.white),
            onPressed: () {
              // Handle more options
            },
          ),
        ],
        leading:
        Padding(
          padding: EdgeInsetsGeometry.all(8),

       child: FloatingActionButton(onPressed: (){
          Navigator.pop(context);
        },
        child: CircleAvatar(
          
            radius: 16,
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
        shape: CircleBorder(
          side: BorderSide(
            color: Colors.white,
            width: 2.0,
          ),
        ),
        
      ),
        ),
        backgroundColor: const Color.fromARGB(255, 52, 173, 56),
      
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/chatbg.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
              BlendMode.darken
            ),
          ),
        ),
      ),
    );
  }
}
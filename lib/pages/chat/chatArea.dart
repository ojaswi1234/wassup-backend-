import 'package:flutter/material.dart';
class ChatArea  extends StatelessWidget {
  ChatArea ({super.key});

  final List<String> actionList = [
  "Img",
  "Doc",
"Locate",
 "Contact",
  ];
  final Map<String, IconData> iconMap = {
    "Img": Icons.image,
    "Doc": Icons.document_scanner,
    "Locate": Icons.location_on,
    "Contact": Icons.person,
  };

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Alex', style: TextStyle(
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
                            
            },
          ),
        ],
        leading:
        Padding(
          padding: EdgeInsetsGeometry.all(8),

       child: FloatingActionButton(onPressed: (){
          Navigator.pop(context);
        },
        shape: CircleBorder(
          side: BorderSide(
            color: Colors.white,
            width: 2.0,
          ),
        ),
        child: CircleAvatar(
          
            radius: 16,
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
        
      ),
        ),
        backgroundColor: const Color.fromARGB(255, 52, 173, 56),
      
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(bottom: (width < 600 ? 32 : 0)),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/chatbg.png'),
            fit:  BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
              BlendMode.darken
            ),
          ),
        ),
      child:  Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
  child: Align(
    alignment: Alignment.bottomCenter,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Form(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Type a message...',
                hintStyle: TextStyle(color: Colors.grey[500]),
                filled: true,
                fillColor: Colors.white,
               
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),    
                suffixIcon: PopupMenuButton<String>(
  icon: Transform.rotate(
    angle: 3.14 / 2,
    child: const Icon(Icons.attachment, color: Colors.black),
  ),
  color: Colors.black,
  itemBuilder: (context) => actionList.map((e) {
    return PopupMenuItem<String>(
      value: e,
      child: Row(
        children: [
          Icon(iconMap[e], color: Colors.white), 
          const SizedBox(width: 8),
          Text(e, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }).toList(),
  onSelected: (value) {
    print(value);
  },
),
                ),
              ),
            ),
          ),
      
        const SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(16.0),
            elevation: 2.0,
            minimumSize: const Size(56.0, 56.0),
          ),
          child: const Icon(
            Icons.send,
            color: Colors.black,
            size: 24.0,
          ),
        ),
      ],
    ),
  ),
)
      ),
    );
  }
}
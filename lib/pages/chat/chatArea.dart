import 'package:flutter/material.dart';

// Theme colors
const kPrimaryColor = Color(0xFFA67B00); // Dark Yellow
const kSecondaryColor = Color(0xFFFFC107); // Amber
const kBackgroundColor = Color(0xFF1E1E1E); // Dark Gray-Black
const kAccentColor = Color(0xFFFFCA28); // Light Amber
const kTextColor = Color(0xFFFFD54F); // Warm Yellow

class ChatArea extends StatelessWidget {
  ChatArea({super.key});

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
        title: Text(
          'Alex',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
        leadingWidth: 72,
        elevation: 10,
        shadowColor: kAccentColor,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert_outlined, color: kTextColor),
            onPressed: () {},
          ),
        ],
        leading: Padding(
          padding: EdgeInsets.all(8),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            shape: CircleBorder(
              side: BorderSide(
                color: kTextColor,
                width: 2.0,
              ),
            ),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(bottom: (width < 600 ? 32 : 0)),
        color: kBackgroundColor,
        child: Padding(
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
                      style: TextStyle(color: Colors.white,
                     
                      ),
                    
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        hintStyle: TextStyle(color: kAccentColor),
                        filled: false,
                        
                        
                        
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: kTextColor, width: 1.0),

                        ),

                        suffixIcon: PopupMenuButton<String>(
                          icon: Transform.rotate(
                            angle: 3.14 / 2,
                            child: Icon(Icons.attachment, color: kPrimaryColor),
                          ),
                          color: kPrimaryColor,
                          itemBuilder: (context) => actionList.map((e) {
                            return PopupMenuItem<String>(
                              value: e,
                              child: Row(
                                children: [
                                  Icon(iconMap[e], color: kTextColor),
                                  const SizedBox(width: 8),
                                  Text(e, style: TextStyle(color: kTextColor)),
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
                    backgroundColor: kSecondaryColor,
                    foregroundColor: kPrimaryColor,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(16.0),
                    elevation: 2.0,
                    minimumSize: const Size(56.0, 56.0),
                  ),
                  child: Icon(
                    Icons.send,
                    color: Color(0xFF1E1E1E),
                    size: 24.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
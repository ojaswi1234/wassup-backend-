import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

// Theme colors
const kPrimaryColor = Color(0xFFA67B00); // Dark Yellow
const kSecondaryColor = Color(0xFFFFC107); // Amber
const kBackgroundColor = Color(0xFF1E1E1E); // Dark Gray-Black
const kAccentColor = Color(0xFFFFCA28); // Light Amber
const kTextColor = Color(0xFFFFD54F); // Warm Yellow

class ChatArea extends StatefulWidget {
  const ChatArea({super.key});

  @override
  State<ChatArea> createState() => _ChatAreaState();
}
int port = 56873;
class _ChatAreaState extends State<ChatArea> {
 

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
      TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
      
        title: Text(
          'My Number',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
        leadingWidth: 72,
        elevation: 7,
        shadowColor: kAccentColor,
        actions: [
          IconButton(
            icon: Icon(Icons.call, color: Colors.white),
            onPressed: () {},
          ),
         PopupMenuButton<String>(
           itemBuilder: (context) => <PopupMenuEntry<String>>[
             PopupMenuItem<String>(
               value: 'profile_settings',
               child: Text('Profile Settings'),
             ),
             PopupMenuItem<String>(
               value: 'item_2',
               child: Text('Item 2'),
             ),
           ],
           icon: Icon(Icons.more_vert, color: Colors.white),
           onSelected: (value) {
             // Handle menu selection
              if (value == 'profile_settings') {
                Navigator.pushNamed(context, '/profile');
              }
           },
         )
        ],
        leading: Padding(
          padding: EdgeInsets.all(8),
          child: FloatingActionButton(
            onPressed: () {
             showDialog(
              context: context, 
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(''),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    
                    children: [
                      CircleAvatar(
                        radius: 72,
                        backgroundImage: AssetImage('assets/images/profile.png'),
                      ),
                      SizedBox(height: 16),
                      Text('My Number', style: TextStyle(fontSize: 18)),
                      Text('user@example.com', style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.message)),
                          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
                          ],)
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
              }
             );
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
                      controller: controller,
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
                          color: const Color.fromARGB(255, 0, 0, 0),
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
                  onPressed: () {
                    controller.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kSecondaryColor,
                    foregroundColor: kPrimaryColor,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(12.0),
                    elevation: 2.0,
                    minimumSize: const Size(44.0, 44.0),
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
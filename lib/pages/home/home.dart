import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _searchController = TextEditingController();

  dynamic count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'ChatX',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'EduNSWACTCursive',
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 12, 20, 23),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
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
            icon: Icon(Icons.notifications, color: Colors.white),
            label: 'Status',
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 0, 61, 1),
              Colors.black,
              Color.fromARGB(255, 83, 75, 0)
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        // The main fix is here: using a Stack
        child: Stack(
          children: [
            // This Column holds your primary content (search bar and list)
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.greenAccent),
                      cursorColor: Colors.greenAccent,
                      decoration: InputDecoration(
                        hintText: 'Search Name/Number.....',
                        hintStyle: const TextStyle(color: Colors.white54),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.greenAccent,
                          
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 12, 20, 23),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                      
                      ),
                      controller: _searchController,
                    ),
                  ),
                ),
                const SizedBox(height: 10), // Add some space between search bar and list

                Expanded(
                  // Wrap ListView in Expanded to prevent layout overflow errors
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: ListView(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                      child: ListTile(
                       
                        
                       
                        title: Text('My Number', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        leading: CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Text(
                            'M',
                            style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold),
                          
                          ),
                        ),
                        trailing: CircleAvatar(
                          backgroundColor: Colors.greenAccent,
                          radius: 12,
                          child:
                          Center( 
                           child:Text(
                            count.toString(),
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
                          )),
                        ),

                        subtitle: Text('Hey There', style: TextStyle(color: Colors.white54)),
                        onTap: () {
                          Navigator.pushNamed(context, '/chat');
                        },
                        
                      
                      ),
                      )
                      // Add more ListTiles for additional chats
                    ],
                  ),
                  )
                ),
              ],
            ),
            // The search button, now correctly positioned inside the Stack
            Positioned(
              bottom: 10,
              right: 30,
              child: FloatingActionButton( // A more suitable widget for a floating action button
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('New Chat'),
                        content: const Text('Start a new chat!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
                backgroundColor: const Color.fromARGB(255, 12, 20, 23),
                child: const Icon(Icons.chat_bubble_outline_rounded, color: Colors.greenAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
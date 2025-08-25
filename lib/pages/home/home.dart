 import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

// 1. Convert to a StatefulWidget to manage the state of the contacts list
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _searchController = TextEditingController();
  
  // 2. Create a list to hold the contacts in the state
  List<Contact> _contacts = [];
  bool _isLoading = false; // To show a loading indicator

  // 3. Create a method within the state to fetch contacts
  Future<void> _fetchContacts() async {
    // Request permission first
    if (!await FlutterContacts.requestPermission()) {
      print("Permission Denied");
      // Optionally, show a snackbar to the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permission denied to access contacts.')),
      );
      return;
    }

    // Set loading state and fetch contacts
    setState(() {
      _isLoading = true;
    });

    try {
      final contacts = await FlutterContacts.getContacts(
        withProperties: true,
        withPhoto: true,
      );
      setState(() {
        _contacts = contacts;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // 4. Show the dialog with the fetched contacts
  void _showContactFlowDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Use StatefulBuilder to allow the dialog's content to be updated.
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(

              backgroundColor: Colors.white54,
              
              title: Text(
                _contacts.isEmpty && !_isLoading 
                    ? "Contacts Permission" 
                    : 'Choose Contact to Chat With',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              content: SizedBox(
                width: double.maxFinite,
                // Conditionally show content based on loading and contacts state
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _contacts.isNotEmpty
                        ? 
                           
                            ListView.builder(
                            shrinkWrap: true,
                            itemCount: _contacts.length,
                            itemBuilder: (context, index) {
                              final contact = _contacts[index];
                              return ListTile(
                                title: Text(contact.displayName),
                                subtitle: Text(contact.phones.isNotEmpty
                                    ? contact.phones.first.number
                                    : 'No phone number'),
                                onTap: () {
                                  print('Selected: ${contact.displayName}');
                                  Navigator.of(context).pop();
                                },
                              );
                            },
                          )
                          
                        : const Text(
                            "To find friends to chat with, this app needs access to your contacts."
                            ),
              ),
              actions: [
                Form(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Search Name/Number.....',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                    controller: _searchController,
                    onChanged: (value) {
                      // Implement search functionality if needed
                    },
                  ),
                )
                ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                TextButton(
                  style: TextButton.styleFrom(
                   alignment: Alignment.centerLeft
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Close"),
                
              ),
              TextButton(
                  style: TextButton.styleFrom(
                   alignment: Alignment.centerRight
                  ),
                  onPressed: () {
                   
                  },
                  child: const Text("Search"),
            )]),
                // Show "Continue" only if contacts haven't been fetched yet
                if (_contacts.isEmpty)
                  TextButton(
                    onPressed: () async {
                      // Use the dialog's own setState to update its UI
                      setState(() {
                        _isLoading = true;
                      });

                      // Fetch contacts using the existing method
                      await _fetchContacts();

                      // Update the dialog again with the fetched contacts
                      setState(() {
                        _isLoading = false;
                      });
                    },
                    child: const Text("Continue"),
                  ),
              ],
            );
          },
        );
      },
    ).then((_) {
      // Reset state when the dialog is closed
      setState(() {
        _contacts = [];
        _isLoading = false;
      });
    });
  }

  void _showPermissionExplanationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Contacts Permission"),
          content: const Text(
              "To find friends to chat with, this app needs access to your contacts."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Close the explanation dialog
                // Now, proceed with fetching contacts, which will trigger the system permission prompt
                await _fetchContacts();
                if (mounted) {
                  _showContactFlowDialog();
                }
              },
              child: const Text("Continue"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'ChatX',
            style: TextStyle(
              color: Colors.white, // Text: Warm Yellow
              fontFamily: 'EduNSWACTCursive',
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color(0xFFA67B00), // Primary: Dark Yellow
          elevation: 2,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings, color:Colors.white), // Accent: Light Amber
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF1E1E1E), // Background: Dark Gray-Black
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.chat, color: Color(0xFFFFC107)), // Secondary: Amber
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications, color: Color(0xFFFFC107)),
              label: 'Status',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group, color: Color(0xFFFFC107)),
              label: 'Communities',
            ),
          ],
          unselectedItemColor: Color(0xFFFFD54F), // Text: Warm Yellow
          unselectedLabelStyle: TextStyle(
            fontSize: 12,
            color: Color(0xFFFFD54F),
          ),
          selectedItemColor: Color(0xFFA67B00), // Primary: Dark Yellow
        ),
        body: Container(
          color: Color(0xFF1E1E1E), // Background: Dark Gray-Black
          child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      style: const TextStyle(color: Color(0xFFFFD54F)), // Text: Warm Yellow
                      cursorColor: Color(0xFFFFD54F),
                      decoration: InputDecoration(
                        hintText: 'Search Name/Number.....',
                        hintStyle: const TextStyle(color: Color(0xFFFFCA28)), // Accent: Light Amber
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color(0xFFA67B00), // Primary: Dark Yellow
                        ),
                        filled: true,
                        fillColor: Color(0xFF1E1E1E), // Background: Dark Gray-Black
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                      ),
                      controller: _searchController,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: ListView(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFA67B00).withOpacity(0.08), // Primary: Dark Yellow
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            title: const Text('Alex',
                                style: TextStyle(
                                    color: Color(0xFFFFD54F), // Text: Warm Yellow
                                    fontWeight: FontWeight.bold)),
                            leading: const CircleAvatar(
                              backgroundColor: Color(0xFFFFC107), // Secondary: Amber
                              child: Text(
                                'A',
                                style: TextStyle(
                                    color: Color(0xFF1E1E1E), // Background: Dark Gray-Black
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            trailing: const CircleAvatar(
                              backgroundColor: Color(0xFFA67B00), // Primary: Dark Yellow
                              radius: 12,
                              child: Center(
                                  child: Text(
                                '1',
                                style: TextStyle(
                                    color: Color(0xFFFFCA28), // Accent: Light Amber
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              )),
                            ),
                            subtitle: const Text('Hey There',
                                style: TextStyle(color: Color(0xFFFFCA28))), // Accent: Light Amber
                            onTap: () {
                              Navigator.pushNamed(context, '/chat');
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              right: 30,
              child: FloatingActionButton(
                onPressed: _showPermissionExplanationDialog,
                backgroundColor: Color(0xFFFFC107), // Secondary: Amber
                child: const Icon(Icons.chat_bubble_outline_rounded,
                    color: Color(0xFF1E1E1E)), // Text: Warm Yellow
              ),
            ),
          ],
        ),
      ),
    );
  }
}
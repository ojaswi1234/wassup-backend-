import 'package:flutter/material.dart';

class Login extends StatelessWidget {
   Login({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: 
      Container(
         decoration: BoxDecoration(
        gradient: const LinearGradient(
        colors: [Colors.green, Colors.black, Colors.yellow],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        
        ),
      ), 
      
      child: Center(
         
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 44.0),
         child: Form(
          key: _formKey,
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text("Login", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),),
            const SizedBox(height: 60),
            MaterialButton(onPressed: () { print("Pressed"); },
            child: const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                "assets/images/profile.png",
              
              ),
            )
            ),
           
            const SizedBox(height: 20),
            TextFormField(
              style: TextStyle(color: Colors.white), // <-- Add this line

              decoration: InputDecoration(
                labelText: "Email",
                
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                ),
               
                
                filled: true,
                fillColor: Colors.black12,
               
                contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                errorStyle: TextStyle(color: Colors.redAccent),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
                           
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value){
                if ( value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
             const SizedBox(height: 20),
            TextFormField(
              style: TextStyle(color: Colors.white), // <-- Add this line
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                ),
                filled: true,
                fillColor: Colors.black12,
                contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                errorStyle: TextStyle(color: Colors.redAccent),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              validator: (value){
                if ( value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle login logic
              },
              child: Text("Login"),
            ),

          ]
          )
      ),
      ),
        ),
      ),
      ),
    );
  }

 
}

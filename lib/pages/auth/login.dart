import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Login extends StatelessWidget {
   Login({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email= '';
  String _password= '';

  void _validateUser(BuildContext context) async{
   if(_formKey.currentState!.validate()){
    _formKey.currentState!.save();
    //print("Email: $_email, Password: $_password");
    try{
      final supabase = Supabase.instance.client;
      final response = await supabase.auth.signInWithPassword(
        email: _email,
        password: _password,
      );
      if (response.user != null && response.session != null) {
        // Login successful, navigate to home page
        Navigator.pushNamed(context, '/home');
      } else {
        // Show error message for invalid credentials
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Invalid email or password")),
        );
      }
      
    }catch(error){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed: $error")),
      );

    }
    

   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
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
              style: TextStyle(color: Colors.white),

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
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),

                labelStyle: TextStyle(color: const Color.fromARGB(148, 255, 255, 255), fontSize: 16.0),
                           
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value){
                if ( value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              onSaved: (value) {
                _email = value!;
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
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
                labelStyle: TextStyle(color: const Color.fromARGB(148, 255, 255, 255), fontSize: 16.0),
              ),
              
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              validator: (value){
                if ( value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              onSaved: (value) {
                _password = value!;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
               
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
              ),
              onPressed: (){
                _validateUser(context);
                 
              },
              child: Text("Login", style: TextStyle(color: Colors.yellow, fontSize: 16)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              
              ),

              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/getStarted');              },
              child: Text("New Here ??, Sign Up", style: TextStyle(color: Colors.white)),
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

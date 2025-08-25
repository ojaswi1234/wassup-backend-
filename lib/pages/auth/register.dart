import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Theme colors
const kPrimaryColor = Color(0xFFA67B00); // Dark Yellow
const kSecondaryColor = Color(0xFFFFC107); // Amber
const kBackgroundColor = Color(0xFF1E1E1E); // Dark Gray-Black
const kAccentColor = Color(0xFFFFCA28); // Light Amber
const kTextColor = Color(0xFFFFD54F); // Warm Yellow

class Register extends StatelessWidget {
  Register({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  final width = WidgetsBinding.instance.window.physicalSize.width / WidgetsBinding.instance.window.devicePixelRatio;

  void _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        final supabase = Supabase.instance.client;
        final response = await supabase.auth.signUp(
          email: _email,
          password: _password,
        );
        if (response.user != null && response.session != null) {
          Navigator.pushNamed(context, '/home');
        }
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registration failed: $error")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 44.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                    ),
                  ),
                  const SizedBox(height: 60),
                  MaterialButton(
                    onPressed: () {
                      print("Pressed");
                    },
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                        "assets/images/profile.png",
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    style: TextStyle(color: kTextColor),
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: kTextColor, width: 2.0),
                      ),
                      filled: true,
                      fillColor: kBackgroundColor,
                      contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: kAccentColor, width: 2.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.red, width: 2.0),
                      ),
                      labelStyle: TextStyle(color: kAccentColor, fontSize: 16.0),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
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
                    style: TextStyle(color: kTextColor),
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: kTextColor, width: 2.0),
                      ),
                      filled: true,
                      fillColor: kBackgroundColor,
                      contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: kAccentColor, width: 2.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.red, width: 2.0),
                      ),
                      labelStyle: TextStyle(color: kAccentColor, fontSize: 16.0),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
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
                      backgroundColor: kSecondaryColor,
                      padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
                    ),
                    onPressed: () => _submitForm(context),
                    child: Text("Register", style: TextStyle(color: Colors.black, fontSize: 16.0)),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      textStyle: TextStyle(fontSize: (width > 600) ? 18 : 12, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/login');
                    },
                    child: Text("Already have an account? Click here to login", style: TextStyle(color: kTextColor)),
                  ),
                  const SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/registerPhone');
                    },
                    color: kSecondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                    child: Text("Use Phone Number Instead", style: TextStyle(color: kBackgroundColor, fontSize: 16)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
       
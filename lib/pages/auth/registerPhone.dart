import 'package:flutter/material.dart';

// Color theme constants
const kPrimaryColor = Color(0xFFA67B00); // Dark Yellow
const kSecondaryColor = Color(0xFFFFC107); // Amber
const kBackgroundColor = Color(0xFF1E1E1E); // Dark Gray-Black
const kAccentColor = Color(0xFFFFCA28); // Light Amber
const kTextColor = Color(0xFFFFD54F); // Warm Yellow

class RegisterPhone extends StatefulWidget {
  const RegisterPhone({super.key});

  @override
  State<RegisterPhone> createState() => _RegisterPhoneState();
}

class _RegisterPhoneState extends State<RegisterPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text('Register with Phone'),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.black,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter your phone number',
              style: TextStyle(
                color: kTextColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.phone,
              style: TextStyle(color: kTextColor),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: kAccentColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: kAccentColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: kSecondaryColor),
                ),
                labelText: 'Phone Number',
                prefixText: '+91 ',
                labelStyle: TextStyle(color: kAccentColor),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  foregroundColor: kTextColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Handle registration logic here
                },
                child: Text(
                  'Send OTP',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
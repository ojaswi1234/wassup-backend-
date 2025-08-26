import 'dart:developer';

import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  String verificationId;
   OtpScreen({super.key
, required this.verificationId
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Match login background
      appBar: AppBar(
        title: const Text('Enter OTP'),
        centerTitle: true,
        backgroundColor: Colors.blue, // Match login appbar color
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Please enter the OTP sent to your phone',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold, // Match login font weight
                color: Colors.black87, // Match login text color
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                labelText: 'OTP',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), // Match login border radius
                ),
                filled: true,
                fillColor: Colors.grey[100], // Match login input background
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Match login button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Match login button radius
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () async {
                  // Handle OTP verification
                  try {
                    // Simulate OTP verification for demo purposes
                    if (_otpController.text.length == 6) {
                      print("OTP verified successfully");
                      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a valid 6-digit OTP'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  } catch (e) {
                    log(e.toString());
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error: ${e.toString()}'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: const Text(
                  'Verify',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold, // Match login button text style
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
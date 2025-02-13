import 'package:flutter/material.dart';
import 'auth/login_screen.dart';
import 'auth/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(1, 8, 12, 1), // Dark background
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // App Title
                  Text(
                    'RetroPress',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color:
                          Color.fromRGBO(239, 214, 172, 1), // Light gold color
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 10),

                  // Subtitle
                  Text(
                    'Timeless Stories, Modern Experience',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(255, 252, 250, 1), // Warm white
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 40),

                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color.fromRGBO(35, 179, 83, 1), // Deep green
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 15),

                  // Sign-Up Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color.fromRGBO(196, 73, 0, 1), // Dark orange
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Copyright Text at the Bottom
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              "© 2025 RetroPress. All rights reserved.",
              style: TextStyle(
                color: Color.fromRGBO(230, 230, 230, 1), // Warm white
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

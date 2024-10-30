import 'package:flutter/material.dart';
import 'package:food_donation/pages/homepage.dart'; // Make sure this path is correct.
import 'package:food_donation/pages/add_donation_page.dart'; // For navigation to the add donation page.
import 'package:food_donation/pages/splash_screen.dart';
import 'package:food_donation/pages/get_started_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Donation App',
      initialRoute: '/', // Start with the splash screen.
      routes: {
        '/': (context) =>  SplashScreen(), // Splash screen route.
        '/getStarted': (context) =>  GetStartedPage(), // Get Started page route.
        '/home': (context) => HomePage(), // Home page route.
        '/add': (context) => AddDonationPage(), // Add Donation page route.
      },
    );
  }
}
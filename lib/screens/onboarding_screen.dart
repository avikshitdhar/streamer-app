import 'package:flutter/material.dart';
import 'package:video_streaming_app/screens/login_screen.dart';
import 'package:video_streaming_app/screens/signup_screen.dart';
import 'package:video_streaming_app/widgets/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  static const routeName = '/onboarding';
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to \nStreamer',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
                text: 'Log in',
              ),
            ),
            CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, SignupScreen.routeName);
                },
                text: 'Sign Up'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:ui'; // For BackdropFilter
import '../shared/screens/login_signup_backdround.dart';
import '../app/theme.dart';
import '../shared/widgets/input.dart';
import '../shared/widgets/button.dart';
import '../shared/widgets/phone_number_dropdown.dart';
import '../shared/widgets/social_media_dropdown.dart';
import '../shared/widgets/goals_dropdown.dart';
import '../shared/widgets/platform_selection.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController _socialMediaController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String selectedCountryCode = '+1';
  String? selectedPlatform = 'Facebook';
  List<String> selectedGoals = [];

  void _handleGoalsChanged(List<String> goals) {
    setState(() {
      selectedGoals = goals;
    });
  }

  void _handlePlatformChanged(String? newPlatform) {
    setState(() {
      selectedPlatform = newPlatform;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const LoginSignupCommonBackground(
            child: SizedBox.shrink(),
          ),
          SafeArea(
            child: Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.black.withOpacity(0.4),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/app_logo.png',
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "OneApp Profile Creation",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Let's start a new journey with OneApp!",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 20),
                          InputWidget(
                            label: 'Full Name',
                            controller: fullNameController,
                          ),
                          const SizedBox(height: 20),
                          PhoneInputWidget(
                            phoneController: phoneController,
                            selectedCountryCode: selectedCountryCode,
                            onCountryCodeChanged: (code) {
                              setState(() {
                                selectedCountryCode = code!;
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          SocialMediaInputWidget(
                            socialMediaController: _socialMediaController,
                            onPlatformChanged: (newPlatform) =>
                                setState(() => selectedPlatform = newPlatform),
                            selectedPlatform: selectedPlatform,
                          ),
                          const SizedBox(height: 20),
                          InputWidget(
                            label: 'Email Address',
                            controller: emailController,
                          ),
                          const SizedBox(height: 20),

                          GoalsInputWidget(
                            onGoalsChanged: _handleGoalsChanged,
                            selectedGoals: selectedGoals,
                          ),
                          const SizedBox(height: 20),
                          PlatformSelectionWidget(
                            selectedPlatform: selectedPlatform,
                            onPlatformChanged: _handlePlatformChanged,
                          ),
                          const SizedBox(height: 20),
                          // Sign-Up Button
                          CustomButton(
                            label: "Get Started",
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/home');
                            },
                          ),
                          const SizedBox(height: 20),

                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Already have an account? Log in",
                              style: TextStyle(
                                color: AppColors.signUpOrange,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

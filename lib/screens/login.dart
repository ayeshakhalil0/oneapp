import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../shared/screens/login_signup_backdround.dart';
import '../app/theme.dart';
import '../shared/widgets/input.dart';
import '../shared/widgets/button.dart';
import './sign_up.dart';
import '../shared/widgets/phone_number_dropdown.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController =
      TextEditingController(); // Controller for OTP
  String selectedCountryCode = '+1'; // Default country code (can be changed)
  bool isPhoneInput = false; // Flag to toggle between phone and Gmail
  bool otpVisible = false; // Flag to show OTP input field

  @override
  Widget build(BuildContext context) {
    return LoginSignupCommonBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/app_logo.png',
                  width: 250,
                ),
                const Text(
                  "Welcome Back!",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Sign in to your OneApp account",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 35),
                // Input widget changes based on isPhoneInput
                isPhoneInput
                    ? PhoneInputWidget(
                        phoneController: phoneController,
                        onCountryCodeChanged: (newCode) {
                          setState(() {
                            selectedCountryCode = newCode!;
                          });
                        },
                        selectedCountryCode: selectedCountryCode,
                      )
                    : InputWidget(
                        label: 'Email Address',
                        controller: emailController,
                      ),
                const SizedBox(height: 20),

                // Display OTP input field if otpVisible is true
                if (otpVisible)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: InputWidget(
                      label: 'Enter OTP',
                      controller: otpController,
                      // keyboardType: TextInputType.number,
                      // decoration: const InputDecoration(hintText: "Enter OTP"),
                    ),
                  ),

                // "Send OTP" or "Login" button
                CustomButton(
                  label: otpVisible ? "Login" : "Send OTP",
                  onPressed: () {
                    if (otpVisible) {
                      if (otpController.text == '000000') {
                        Navigator.pushReplacementNamed(
                            context, '/home'); // Navigate to HomePage
                      } else {
                        Fluttertoast.showToast(msg: "Invalid OTP");
                      }
                    } else {
                      // Show OTP input field
                      if (isPhoneInput) {
                        if (phoneController.text.isNotEmpty) {
                          setState(() {
                            otpVisible = true; // Show OTP input
                          });
                        } else {
                          Fluttertoast.showToast(
                              msg: "Please enter a phone number.");
                        }
                      } else {
                        if (emailController.text.isNotEmpty &&
                            _isValidEmail(emailController.text)) {
                          setState(() {
                            otpVisible = true; // Show OTP input
                          });
                        } else {
                          Fluttertoast.showToast(
                              msg: "Please enter a valid email address.");
                        }
                      }
                    }
                  },
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.lineGray,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Or continue with",
                        style: TextStyle(color: AppColors.lineGray),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.lineGray,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isPhoneInput = true;
                        });
                      },
                      child: _buildLogoCircle(
                        logo: const Icon(Icons.phone, color: Colors.white),
                        backgroundColor: AppColors
                            .loginScreenIconBackground, // Replace with your desired color
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isPhoneInput = false;
                        });
                      },
                      child: _buildLogoCircle(
                          logo: Logo(Logos.google, size: 24),
                          backgroundColor: AppColors.loginScreenIconBackground),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Don't have an account? Sign up",
                    style: TextStyle(
                      color: AppColors.signUpOrange,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Email validation method
  bool _isValidEmail(String email) {
    RegExp emailRegExp =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return emailRegExp.hasMatch(email);
  }

  Widget _buildLogoCircle(
      {required Widget logo, required Color backgroundColor}) {
    return Container(
      width: 50, // Circle width
      height: 50, // Circle height
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(child: logo),
    );
  }
}

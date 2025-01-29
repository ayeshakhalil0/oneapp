import 'package:flutter/material.dart';
import 'package:oneapp/app/theme.dart';
import 'package:oneapp/screens/login.dart';
import 'package:oneapp/shared/screens/common_background.dart';
import '../shared/widgets/animated_circle_widget.dart';
import '../shared/widgets/profile_screen_common_widget.dart';
import 'package:icons_plus/icons_plus.dart';
import 'profile_detail.dart';
import 'invoice_info.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          // Make content scrollable
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AnimatedCircleWidget(),
              const SizedBox(height: 20),
              const Text(
                'Account Related',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.secondaryBackgroundColor,
                ),
              ),
              const SizedBox(height: 10),
              ProfileItemWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileDetailsPage(),
                    ),
                  );
                },
                text: 'Profile Details',
                leftIcon: Icons.person_2_rounded,
              ),
              ProfileItemWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InvoiceDetailsPage()),
                  );
                },
                text: 'Invoice Information', // Text for the widget
                leftIcon: Icons.document_scanner, // Icon for the widget
              ),
              ProfileItemWidget(
                onTap: () {},
                text: 'Notification Setting',
                leftIcon: Icons.notification_important,
                isNotification: true,
              ),
              const SizedBox(height: 15),
              const Text(
                'Feedback',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.secondaryBackgroundColor,
                ),
              ),
              const SizedBox(height: 10),
              ProfileItemWidget(
                onTap: () {
                  // Define what should happen when the widget is tapped
                  print("Support tapped");
                },
                text: 'Support', // Text for the widget
                leftIcon: Icons.support, // Icon for the widget
              ),
              ProfileItemWidget(
                onTap: () {
                  // Define what should happen when the widget is tapped
                  print("about tapped");
                },
                text: 'About and T&C', // Text for the widget
                leftIcon: Icons.warning, // Icon for the widget
              ),
              const SizedBox(height: 20),
              ProfileItemWidget(
                onTap: () {
                  // Define what should happen when the widget is tapped
                  print("DLT account tapped");
                },
                text: 'Delete Account',
                leftIcon: Icons.delete,
              ),
              ProfileItemWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                text: 'Logout', // Text for the widget
                leftIcon: Icons.logout, // Icon for the widget
              ),
              const SizedBox(height: 25.0),
              Column(
                children: [
                  const Text(
                    'Follow us on Social Media',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: AppColors.secondaryBackgroundColor,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildLogoCircle(
                        logo: Logo(Logos.facebook_f, size: 24),
                        backgroundColor: const Color(0xff18407C),
                      ),
                      const SizedBox(width: 10),
                      _buildLogoCircle(
                        logo: Logo(Logos.instagram, size: 24),
                        backgroundColor: const Color(0xff75371F),
                      ),
                      const SizedBox(width: 10),
                      _buildLogoCircle(
                        logo: Logo(Logos.youtube, size: 24),
                        backgroundColor: const Color(0xff770504),
                      ),
                      const SizedBox(width: 10),
                      _buildLogoCircle(
                        logo: Logo(Logos.linkedin, size: 24),
                        backgroundColor: const Color(0xff163964),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25.0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
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

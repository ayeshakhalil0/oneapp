import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../screens/launch_page.dart';
import '../screens/wallet_page.dart';
import '../screens/profile_page.dart';
import '../screens/landing_page.dart';
import '../app/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // List of screens for the navigation
  final List<Widget> _screens = [
    const LandingPage(),
    const LaunchPage(),
    const WalletPage(),
    const ProfilePage(),
  ];

  // Define the selected color
  final Color _selectedColor = AppColors.signUpOrange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _screens[_currentIndex], // Display the current screen
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: AppColors.darkTextGray,
        buttonBackgroundColor: AppColors.darkTextGray,
        height: 75,
        items: [
          _buildNavItem(Icons.home, 'Home', 0),
          _buildNavItem(Icons.rocket_launch, 'Launch', 1),
          _buildNavItem(Icons.account_balance_wallet, 'Wallet', 2),
          _buildNavItem(Icons.person, 'Profile', 3),
        ],
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the index on tap
          });
        },
      ),
    );
  }

  // Helper function to build each navigation item with icon and label
  Widget _buildNavItem(IconData icon, String label, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(
            icon,
            size: 28,
            color: _currentIndex == index
                ? _selectedColor
                : AppColors.secondaryBackgroundColor,
          ),
        ),
        if (_currentIndex != index)
          Text(
            label,
            style: TextStyle(
              color: _currentIndex == index
                  ? _selectedColor
                  : AppColors.secondaryBackgroundColor,
              fontSize: 12,
            ),
          ),
      ],
    );
  }
}

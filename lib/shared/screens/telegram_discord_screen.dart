import 'package:flutter/material.dart';
import '../../app/theme.dart';

class DiscordTelegram extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String firstContainerText;
  final String secondContainerText;
  final int firstContainerCount;
  final int secondContainerCount;
  final IconData firstContainerIcon;
  final IconData secondContainerIcon;
  final VoidCallback onView;
  final VoidCallback onEdit;
  final VoidCallback onShare;

  const DiscordTelegram({
    Key? key,
    required this.firstText,
    required this.secondText,
    required this.firstContainerText,
    required this.secondContainerText,
    required this.firstContainerCount,
    required this.secondContainerCount,
    required this.firstContainerIcon,
    required this.secondContainerIcon,
    required this.onView,
    required this.onEdit,
    required this.onShare,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          firstText,
          style: const TextStyle(
              fontSize: 22,
              color: AppColors.white,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          secondText,
          style: const TextStyle(
            fontSize: 15,
            color: AppColors.signUpOrange,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildInfoContainer(
              text: firstContainerText,
              count: firstContainerCount,
              icon: firstContainerIcon,
              color: AppColors.discordTelegramColor1,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
            _buildInfoContainer(
              text: secondContainerText,
              count: secondContainerCount,
              icon: secondContainerIcon,
              color: AppColors.discordTelegramColor2,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton(
              label: 'View',
              icon: Icons.visibility,
              onPressed: onView,
            ),
            _buildButton(
              label: 'Edit',
              icon: Icons.edit,
              onPressed: onEdit,
            ),
            _buildButton(
              label: 'Share',
              icon: Icons.share,
              onPressed: onShare,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoContainer({
    required String text,
    required int count,
    required IconData icon,
    required Color color,
    required double screenWidth,
    required double screenHeight,
  }) {
    return Container(
      width: screenWidth * 0.45,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                count.toString(),
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 8),
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(250, 255, 254, 0.5),
                      Color.fromRGBO(255, 255, 255, 0.6),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 35,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 20, color: Colors.white),
      label: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF181818),
        side: const BorderSide(color: Color(0xFF3B3B3B)),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

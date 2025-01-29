import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../modal/mpin_reset.dart';
import '../modal/add_bank_account.dart';
import '../modal/add_upi_id.dart';

class WalletMenu extends StatelessWidget {
  const WalletMenu({Key? key}) : super(key: key);

  static void show(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0, right: 10.0),
            child: Container(
              width: screenWidth * 0.5,
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.lineGray,
                  width: 1, // Border width
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildMenuItem(
                    icon: Icons.credit_card,
                    label: 'Add UPI ID',
                    onTap: () {
                      Navigator.pop(context);
                      AddUPIModal.show(context);
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.account_balance,
                    label: 'Add Bank Account',
                    onTap: () {
                      Navigator.pop(context);
                      AddBankAccountModal.show(context);
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.pin,
                    label: 'Set Mpin',
                    onTap: () {
                      Navigator.pop(context);
                      MpinResetModal.show(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        leading: Icon(icon, color: AppColors.signUpOrange),
        title: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // Widget is static, triggered by `show` method
  }
}

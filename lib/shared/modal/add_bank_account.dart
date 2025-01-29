import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../widgets/input.dart';
import '../widgets/button.dart';

class AddBankAccountModal extends StatefulWidget {
  const AddBankAccountModal({Key? key}) : super(key: key);

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => const AddBankAccountModal(),
    );
  }

  @override
  State<AddBankAccountModal> createState() => _AddBankAccountModalState();
}

class _AddBankAccountModalState extends State<AddBankAccountModal> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _ifscController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.lineGray,
            width: 0.9,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.account_balance, color: AppColors.signUpOrange),
                SizedBox(width: 10),
                Text(
                  'Add Bank Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            InputWidget(
              label: 'Account Holder Name',
              controller: _nameController,
            ),
            const SizedBox(height: 15),
            InputWidget(
              label: 'Account Number',
              controller: _accountController,
            ),
            const SizedBox(height: 15),
            InputWidget(
              label: 'IFSC Code',
              controller: _ifscController,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              child: CustomButton(
                label: "Add Account",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

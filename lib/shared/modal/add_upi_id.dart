import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../widgets/input.dart';
import '../widgets/button.dart';

// UPI ID Modal
class AddUPIModal extends StatefulWidget {
  const AddUPIModal({Key? key}) : super(key: key);

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AddUPIModal(),
    );
  }

  @override
  State<AddUPIModal> createState() => _AddUPIModalState();
}

class _AddUPIModalState extends State<AddUPIModal> {
  final TextEditingController _upiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: screenWidth * 0.9,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.lineGray,
            width: 0.8,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wallet, color: AppColors.signUpOrange),
                  SizedBox(width: 10),
                  Text(
                    'Add UPI ID',
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
                label: 'Enter UPI ID',
                controller: _upiController,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  label: "Enter UPI ID",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

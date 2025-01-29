import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../widgets/input.dart';
import '../widgets/button.dart';

class MpinResetModal extends StatefulWidget {
  const MpinResetModal({Key? key}) : super(key: key);

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => const MpinResetModal(),
    );
  }

  @override
  State<MpinResetModal> createState() => _MpinResetModalState();
}

class _MpinResetModalState extends State<MpinResetModal> {
  final TextEditingController _mpinController = TextEditingController();
  bool _showOtpScreen = false;
  List<TextEditingController> _otpControllers = [];
  final List<FocusNode> _focusNodes = [];

  @override
  void initState() {
    super.initState();
    // Initialize 6 controllers and focus nodes for OTP fields
    for (int i = 0; i < 6; i++) {
      _otpControllers.add(TextEditingController());
      _focusNodes.add(FocusNode());
    }
  }

  @override
  void dispose() {
    _mpinController.dispose();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  Widget _buildOtpFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        6,
        (index) => SizedBox(
          width: 40,
          height: 40,
          child: TextField(
            controller: _otpControllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            maxLength: 1,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 20),
            decoration: InputDecoration(
              counterText: "",
              filled: true,
              fillColor: AppColors.darkTextGray,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              if (value.length == 1 && index < 5) {
                _focusNodes[index + 1].requestFocus();
              } else if (value.isEmpty && index > 0) {
                _focusNodes[index - 1].requestFocus();
              }
            },
          ),
        ),
      ),
    );
  }

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
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock_reset,
                  color: AppColors.signUpOrange,
                ),
                SizedBox(width: 10),
                Text(
                  'Mpin Reset',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (!_showOtpScreen) ...[
              InputWidget(
                label: 'Enter New Mpin',
                controller: _mpinController,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  label: "Send OTP",
                  onPressed: () {
                    setState(() {
                      _showOtpScreen = true;
                    });
                  },
                ),
              ),
            ] else ...[
              const Text(
                'Enter OTP',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 15),
              _buildOtpFields(),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  label: "Reset Mpin",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

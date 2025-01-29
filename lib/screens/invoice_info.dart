import 'package:flutter/material.dart';
import 'package:oneapp/shared/screens/common_background.dart';
import 'package:oneapp/shared/styles/common_header.dart';
import '../../app/theme.dart';
import '../shared/widgets/input.dart';
import '../shared/widgets/button.dart';

class InvoiceDetailsPage extends StatefulWidget {
  const InvoiceDetailsPage({Key? key}) : super(key: key);

  @override
  _InvoiceDetailsPageState createState() => _InvoiceDetailsPageState();
}

class _InvoiceDetailsPageState extends State<InvoiceDetailsPage> {
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressLine1Controller = TextEditingController();
  final TextEditingController _addressLine2Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _panNumberController = TextEditingController();
  final TextEditingController _gstinController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _sacCodeController = TextEditingController();

  void _saveInvoiceDetails() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Invoice details saved successfully!',
            style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.profileCommonWidgetColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonHeader(title: 'Invoice Inormation'),
              const SizedBox(height: 15),
              _buildInputField('State', _stateController),
              const SizedBox(height: 15),
              _buildInputField('First Name', _firstNameController),
              const SizedBox(height: 15),
              _buildInputField('Last Name', _lastNameController),
              const SizedBox(height: 15),
              _buildInputField('Email', _emailController),
              const SizedBox(height: 15),
              _buildInputField('Address Line 1', _addressLine1Controller),
              const SizedBox(height: 15),
              _buildInputField('Address Line 2', _addressLine2Controller),
              const SizedBox(height: 15),
              _buildInputField('City', _cityController),
              const SizedBox(height: 15),
              _buildInputField('Pincode', _pincodeController),
              const SizedBox(height: 15),
              _buildInputField('PAN Number', _panNumberController),
              const SizedBox(height: 15),
              _buildInputField('GSTIN', _gstinController),
              const SizedBox(height: 15),
              _buildInputField('Country', _countryController),
              const SizedBox(height: 15),
              _buildInputField('SAC Code', _sacCodeController),
              const SizedBox(height: 25),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: CustomButton(
                    label: 'Save Details',
                    onPressed: _saveInvoiceDetails,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return InputWidget(
      label: label,
      controller: controller,
    );
  }
}

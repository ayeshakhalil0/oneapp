// import 'package:flutter/material.dart';
// import '../../app/theme.dart';

// class PhoneInputWidget extends StatelessWidget {
//   final TextEditingController phoneController;
//   final ValueChanged<String?> onCountryCodeChanged;
//   final String selectedCountryCode;

//   const PhoneInputWidget({
//     Key? key,
//     required this.phoneController,
//     required this.onCountryCodeChanged,
//     required this.selectedCountryCode,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final countryList = [
//       {'code': '+1', 'flag': '🇺🇸', 'country': 'America'},
//       {'code': '+91', 'flag': '🇮🇳', 'country': 'India'},
//       {'code': '+44', 'flag': '🇬🇧', 'country': 'UK'},
//       {'code': '+12', 'flag': '🇺🇸', 'country': 'USA'},
//       {'code': '+913', 'flag': '🇮🇳', 'country': 'India'},
//       {'code': '+444', 'flag': '🇬🇧', 'country': 'UK'},
//       {'code': '+912', 'flag': '🇮🇳', 'country': 'India'},
//       {'code': '+43', 'flag': '🇬🇧', 'country': 'UK'},
//       {'code': '+13', 'flag': '🇺🇸', 'country': 'USA'},
//     ];

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           "Phone Number",
//           style: TextStyle(
//             color: AppColors.white,
//             fontSize: 14,
//           ),
//         ),
//         const SizedBox(height: 5),
//         Container(
//           // padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//           decoration: BoxDecoration(
//             color: AppColors.darkTextGray,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Row(
//             children: [
//               // Dropdown for country code inside the same container
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                 decoration: BoxDecoration(
//                   color: AppColors.darkTextGray,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: DropdownButtonHideUnderline(
//                   child: DropdownButton<String>(
//                     menuMaxHeight: 150,
//                     menuWidth: MediaQuery.of(context).size.width * 0.75,
//                     borderRadius: BorderRadius.circular(10),
//                     value: selectedCountryCode,
//                     onChanged: onCountryCodeChanged,
//                     dropdownColor: AppColors.darkTextGray,
//                     items: countryList.map((country) {
//                       return DropdownMenuItem<String>(
//                         value: country['code'],
//                         child: Row(
//                           children: [
//                             Text(
//                               country['flag']!,
//                               style: const TextStyle(fontSize: 16),
//                             ),
//                             const SizedBox(width: 3),
//                             Text(
//                               country['code']!,
//                               style: const TextStyle(
//                                 color: AppColors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     }).toList(),
//                     style: const TextStyle(
//                       color: AppColors.white,
//                       fontSize: 16,
//                     ),
//                     iconEnabledColor: AppColors.white,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 8),
//               // Input field for phone number
//               Expanded(
//                 child: TextField(
//                   controller: phoneController,
//                   style: const TextStyle(color: AppColors.white),
//                   keyboardType: TextInputType.phone,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: AppColors.darkTextGray,
//                     hintText: "Phone Number",
//                     hintStyle: const TextStyle(color: AppColors.lightGray),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../app/theme.dart';

class PhoneInputWidget extends StatelessWidget {
  final TextEditingController phoneController;
  final ValueChanged<String?> onCountryCodeChanged;
  final String selectedCountryCode;

  const PhoneInputWidget({
    Key? key,
    required this.phoneController,
    required this.onCountryCodeChanged,
    required this.selectedCountryCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Phone Number",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: AppColors.darkTextGray,
            borderRadius: BorderRadius.circular(8),
          ),
          child: IntlPhoneField(
            controller: phoneController,
            initialCountryCode: 'IN',
            dropdownTextStyle: const TextStyle(
              color: AppColors.white,
            ),
            style: const TextStyle(
              color: AppColors.white,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.darkTextGray,
              hintText: "Phone Number",
              hintStyle: const TextStyle(color: AppColors.lightGray),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
            ),
            dropdownIcon: const Icon(
              Icons.arrow_drop_down,
              color: AppColors.white,
            ),
            onCountryChanged: (country) {
              onCountryCodeChanged(country.dialCode);
            },
            onChanged: (phone) {
              // Handle phone number changes if needed
            },
          ),
        ),
      ],
    );
  }
}

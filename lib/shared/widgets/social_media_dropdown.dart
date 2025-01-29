import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart'; // Import the icons_plus package
import '../../app/theme.dart';

class SocialMediaInputWidget extends StatefulWidget {
  final TextEditingController socialMediaController;
  final ValueChanged<String?> onPlatformChanged;
  final String? selectedPlatform;

  const SocialMediaInputWidget({
    Key? key,
    required this.socialMediaController,
    required this.onPlatformChanged,
    required this.selectedPlatform,
  }) : super(key: key);

  @override
  _SocialMediaInputWidgetState createState() => _SocialMediaInputWidgetState();
}

class _SocialMediaInputWidgetState extends State<SocialMediaInputWidget> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final platforms = [
      {'platform': 'Facebook', 'icon': Logos.facebook_logo},
      {'platform': 'Instagram', 'icon': Logos.instagram},
      {'platform': 'Twitter', 'icon': Logos.twitter},
      {'platform': 'Telegram', 'icon': Logos.telegram},
      {'platform': 'LinkedIn', 'icon': Logos.linkedin},
      {'platform': 'Website', 'icon': Logos.web_components_dot_org},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Social Media ID",
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
          child: Row(
            children: [
              // Dropdown for social media platforms inside the same container
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: AppColors.darkTextGray,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Focus(
                  focusNode: _focusNode,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      menuMaxHeight: 150,
                      menuWidth: MediaQuery.of(context).size.width * 0.75,
                      borderRadius: BorderRadius.circular(10),
                      value: widget.selectedPlatform,
                      onChanged: widget.onPlatformChanged,
                      dropdownColor: AppColors.darkTextGray,
                      items: platforms.map((platform) {
                        return DropdownMenuItem<String>(
                          value: platform['platform'] as String,
                          child: Row(
                            children: [
                              Logo(
                                platform['icon'],
                                size: 24,
                              ),
                              const SizedBox(width: 8),
                              if (_focusNode.hasFocus)
                                Text(
                                  platform['platform'] as String,
                                  style: const TextStyle(
                                    color: AppColors.white,
                                  ),
                                ),
                            ],
                          ),
                        );
                      }).toList(),
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                      iconEnabledColor: AppColors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Input field for social media ID
              Expanded(
                child: TextField(
                  controller: widget.socialMediaController,
                  style: const TextStyle(color: AppColors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.darkTextGray,
                    hintText: "Social media ID",
                    hintStyle: const TextStyle(color: AppColors.lightGray),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import '../../app/theme.dart';

// class SocialMediaInputWidget extends StatelessWidget {
//   final TextEditingController socialMediaController;
//   final ValueChanged<String?> onPlatformChanged;
//   final String? selectedPlatform;

//   const SocialMediaInputWidget({
//     Key? key,
//     required this.socialMediaController,
//     required this.onPlatformChanged,
//     required this.selectedPlatform,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final platforms = [
//       {'platform': 'Facebook', 'icon': Icons.facebook},
//       {'platform': 'Instagram', 'icon': Icons.camera_alt},
//       {'platform': 'Twitter', 'icon': Icons.alternate_email},
//       {'platform': 'Telegram', 'icon': Icons.telegram},
//       {'platform': 'LinkedIn', 'icon': Icons.link},
//       {'platform': 'Website', 'icon': Icons.web},
//     ];

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           "Social Media ID",
//           style: TextStyle(
//             color: AppColors.white,
//             fontSize: 14,
//           ),
//         ),
//         const SizedBox(height: 5),
//         Container(
//           decoration: BoxDecoration(
//             color: AppColors.darkTextGray,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Row(
//             children: [
//               // Dropdown for social media platforms inside the same container
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
//                     value: selectedPlatform,
//                     onChanged: onPlatformChanged,
//                     dropdownColor: AppColors.darkTextGray,
//                     items: platforms.map((platform) {
//                       return DropdownMenuItem<String>(
//                         value: platform['platform'] as String,
//                         child: Row(
//                           children: [
//                             Icon(
//                               platform['icon'] as IconData,
//                               color: AppColors.white,
//                             ),
//                             const SizedBox(width: 8),
//                             Text(
//                               platform['platform'] as String,
//                               style: const TextStyle(
//                                 color: AppColors.white,
//                               ),
//                             ),
//                             if (selectedPlatform ==
//                                 platform['platform'] as String)
//                               const SizedBox(width: 8),
//                             if (selectedPlatform ==
//                                 platform['platform'] as String)
//                               const Icon(
//                                 Icons.check,
//                                 color: AppColors.white,
//                                 size: 18,
//                               ),
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
//               // Input field for social media ID
//               Expanded(
//                 child: TextField(
//                   controller: socialMediaController,
//                   style: const TextStyle(color: AppColors.white),
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: AppColors.darkTextGray,
//                     hintText: "Social media ID",
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

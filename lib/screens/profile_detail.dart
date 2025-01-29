import 'package:flutter/material.dart';
import 'package:oneapp/app/theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oneapp/shared/screens/common_background.dart';
import 'package:oneapp/shared/styles/common_header.dart';
import 'package:oneapp/shared/widgets/button.dart';
import 'dart:io';
import '../shared/widgets/input_profile_detail.dart';

class ProfileDetailsPage extends StatefulWidget {
  const ProfileDetailsPage({Key? key}) : super(key: key);

  @override
  _ProfileDetailsPageState createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<ProfileDetailsPage> {
  final TextEditingController _displayNameController =
      TextEditingController(text: "John Doe");
  final TextEditingController _usernameController =
      TextEditingController(text: "johndoe123");
  final TextEditingController _phoneController =
      TextEditingController(text: "+1 (555) 123-4567");
  final TextEditingController _emailController =
      TextEditingController(text: "john.doe@example.com");

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  bool _isEditingDisplayName = false;
  bool _isEditingUsername = false;
  bool _isEditingPhone = false;
  bool _isEditingEmail = false;

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image selection error: $e')),
      );
    }
  }

  void _deleteImage() {
    setState(() {
      _imageFile = null;
    });
  }

  void _saveProfileChanges() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile updated', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.profileCommonWidgetColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CommonHeader(title: 'Profile Details'),
            const SizedBox(height: 20),
            _buildProfileImage(),
            const SizedBox(height: 30),
            _buildProfileDetails(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 70,
          backgroundColor: AppColors.darkTextGray,
          backgroundImage: _imageFile != null
              ? FileImage(_imageFile!)
              : const NetworkImage(
                  'https://i.pinimg.com/564x/81/8a/1b/818a1b89a57c2ee0fb7619b95e11aebd.jpg'),
        ),
        Positioned(
          bottom: 5, // Positioning close to the bottom of the CircleAvatar
          right: 5, // Aligning with the bottom-right corner of the CircleAvatar
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.profileCommonWidgetColor.withOpacity(0.7),
              shape: BoxShape.circle,
            ),
            child: PopupMenuButton<String>(
              color: AppColors.darkTextGray,
              icon: const Icon(Icons.edit, color: Colors.white, size: 20),
              onSelected: (value) {
                switch (value) {
                  case 'gallery':
                    _pickImage(ImageSource.gallery);
                    break;
                  case 'delete':
                    _deleteImage();
                    break;
                }
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem<String>(
                  value: 'gallery',
                  child: ListTile(
                    leading: Icon(Icons.photo_library, color: Colors.white),
                    title: Text('Choose from Gallery',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'delete',
                  child: ListTile(
                    leading: Icon(Icons.delete, color: Colors.white),
                    title: Text('Delete Image',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileDetails() {
    return Column(
      children: [
        _buildEditableField(
          label: 'Display Name',
          controller: _displayNameController,
          isEditing: _isEditingDisplayName,
          onEditToggle: () =>
              setState(() => _isEditingDisplayName = !_isEditingDisplayName),
        ),
        const SizedBox(height: 15),
        _buildEditableField(
          label: 'Username',
          controller: _usernameController,
          isEditing: _isEditingUsername,
          onEditToggle: () =>
              setState(() => _isEditingUsername = !_isEditingUsername),
        ),
        const SizedBox(height: 15),
        _buildEditableField(
          label: 'Phone Number',
          controller: _phoneController,
          isEditing: _isEditingPhone,
          onEditToggle: () =>
              setState(() => _isEditingPhone = !_isEditingPhone),
        ),
        const SizedBox(height: 15),
        _buildEditableField(
          label: 'Email Address',
          controller: _emailController,
          isEditing: _isEditingEmail,
          onEditToggle: () =>
              setState(() => _isEditingEmail = !_isEditingEmail),
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.35,
          child: CustomButton(
              label: 'Save Changes', onPressed: _saveProfileChanges),
        ),
      ],
    );
  }

  Widget _buildEditableField({
    required String label,
    required TextEditingController controller,
    required bool isEditing,
    required VoidCallback onEditToggle,
  }) {
    return Row(
      children: [
        Expanded(
          child: InputWidget(
            label: label,
            controller: controller,
            enabled: isEditing,
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onEditToggle,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.profileCommonWidgetColor.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isEditing ? Icons.check : Icons.edit,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }
}

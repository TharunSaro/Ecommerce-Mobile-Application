// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../config/app_colors.dart';
import '../../config/app_images.dart';
import 'HelpCenter/FAQ_screen.dart';
import 'edit_address/edit_address_screen.dart';
import 'edit_profile/edit_profile_screen.dart';
import 'language_screen.dart';
import 'notification/notification_screen.dart';
import 'payment/payment_methods.dart';
import 'privacy_policy_screen.dart';
import 'security_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  AppBar _buildAppBar() {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light, // Change the status bar text color
      ),
      elevation: 0,
      backgroundColor: AppColors.backgroundColor,
      title: Row(
        children: [
          Image.asset(
            AppImages.appLogo,
            width: 100,
            height: 100,
          ),
          const SizedBox(width: 8),
          const Text(
            "Profile",
            style: TextStyle(
              color: AppColors.textColorPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.more_vert,
            color: AppColors.textColorPrimary,
          ),
          onPressed: () {
            // TODO: Implement action menu functionality
          },
        ),
      ],
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(AppImages.userAvatar1), 
              ),
              Positioned(
                bottom: 0,
                right: 4,
                child: _buildEditIcon(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Tharun Saro',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textColorPrimary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '80566945xx',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textColorSecondary,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the edit icon for the profile picture.
  Widget _buildEditIcon() {
    return ClipOval(
      child: Container(
        color: AppColors.primaryColor,
        child: IconButton(
          icon: const Icon(
            Icons.edit,
            color: AppColors.buttonTextColor,
            size: 20,
          ),
          onPressed: () {
            // TODO: Implement edit profile picture functionality
          },
        ),
      ),
    );
  }

  /// Builds the list of profile options.
  Widget _buildProfileOptions(BuildContext context) {
    return Column(
      children: [
        _buildProfileOption(
          context,
          icon: Icons.person,
          text: 'Edit Profile',
          onTap: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  EditProfileScreen()),
  );
          },
        ),
        _buildProfileOption(
          context,
          icon: Icons.location_on,
          text: 'Address',
          onTap: () {
            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  AddressEditScreen()),
  );
                    },
        ),
        _buildProfileOption(
          context,
          icon: Icons.notifications,
          text: 'Notification',
          onTap: () {
            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => NotificationScreen()),
  );
                    },
        ),
        _buildProfileOption(
          context,
          icon: Icons.payment,
          text: 'Payment',
          onTap: () {
            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PaymentMethodScreen()),
  );
                    },
        ),
        _buildProfileOption(
          context,
          icon: Icons.security,
          text: 'Security',
          onTap: () {
            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SecurityScreen()),
  );
                    },
        ),
        _buildProfileOption(
          context,
          icon: Icons.language,
          text: 'Language',
          trailingText: 'English (US)',
          onTap: () {
            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LanguageScreen()),
  );
                    },
        ),
        _buildProfileOption(
          context,
          icon: Icons.dark_mode,
          text: 'Dark Mode',
          trailing: Switch(
            value: false,
            onChanged: (bool value) {
              // TODO: Implement dark mode toggle functionality
            },
          ),
        ),
        _buildProfileOption(
          context,
          icon: Icons.privacy_tip,
          text: 'Privacy Policy',
          onTap: () {
            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
  );            
          },
        ),
        _buildProfileOption(
          context,
          icon: Icons.help,
          text: 'Help Center',
          onTap: () {
Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => FAQScreen()),
  );          },
        ),
        _buildProfileOption(
          context,
          icon: Icons.group,
          text: 'Invite Friends',
          onTap: () {
/* Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SecondRoute()),
  );     */      },
        ),
        _buildProfileOption(
          context,
          icon: Icons.logout,
          text: 'Logout',
          textColor: Colors.red,
          onTap: () {
/* Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SecondRoute()),
  );        */   },
        ),
      ],
    );
  }

  /// Helper method to build a profile option list tile.
  Widget _buildProfileOption(
    BuildContext context, {
    required IconData icon,
    required String text,
    VoidCallback? onTap,
    Widget? trailing,
    String? trailingText,
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.textColorPrimary,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: textColor ?? AppColors.textColorPrimary,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailing ?? (trailingText != null
          ? Text(
              trailingText,
              style: const TextStyle(
                color: AppColors.textColorSecondary,
              ),
            )
          : const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.textColorSecondary,
              size: 16,
            )),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            const Divider(color: AppColors.dividerColor, thickness: 1),
            _buildProfileOptions(context),
          ],
        ),
      ),
    );
  }
}

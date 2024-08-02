import 'package:flutter/material.dart';
import 'package:tembelea_goma/widgets/app_large_text.dart';
import 'package:tembelea_goma/misc/colors.dart';
import 'package:tembelea_goma/pages/home_page.dart';
import 'package:tembelea_goma/pages/welcome_page.dart'; // Import the WelcomePage
import '../widgets/apa_text.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else if (index == 1) {
        // Navigate to Explore
      } else if (index == 2) {
        // Navigate to Notifications
      }
      // Already in Profile
    });
  }

  void _showChangePasswordDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ChangePasswordDialog();
      },
    );
  }

  void _logout() {
    // Implement the logout functionality (e.g., clearing user session)

    // Navigate to WelcomePage and clear navigation stack
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => WelcomePage()),
          (Route<dynamic> route) => false, // Removes all previous routes
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background Image
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/tshukudu.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Transparent Content Area
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Profile Title
                        AppLargeText(
                          text: 'Profile',
                          color: AppColors.mainColor,
                          size: 24,
                        ),
                        SizedBox(height: 16),
                        // Circle Avatar
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColors.mainColor.withOpacity(0.1),
                          child: Icon(Icons.person, size: 50, color: AppColors.mainColor),
                        ),
                        SizedBox(height: 32),
                        // User Details
                        _buildProfileDetailRow('Name:', 'Clovis Mushagalusa'),
                        _buildProfileDetailRow('Email:', 'cloviscirubakaderha@gmail.com'),
                        _buildProfileDetailRow('Phone Number:', '+233256284489'),
                        SizedBox(height: 16),
                        // Change Password Link
                        GestureDetector(
                          onTap: _showChangePasswordDialog,
                          child: AppText(
                            text: "Change Password",
                            color: AppColors.mainColor,
                            size: 16,
                          ),
                        ),
                        SizedBox(height: 32),
                        // Logout Button
                        ElevatedButton(
                          onPressed: _logout,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(text: 'Logout', color: Colors.white),
                              SizedBox(width: 5),
                              Icon(Icons.logout, color: Colors.white),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: AppColors.mainColor,
                            padding: EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildProfileDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(text: label, color: AppColors.textColor2, size: 18),
          SizedBox(width: 8),
          Expanded(
            child: Wrap(
              children: [
                AppText(
                  text: value,
                  color: AppColors.textColor1,
                  size: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChangePasswordDialog extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: AppLargeText(text: 'Change Password', size: 20, color: AppColors.mainColor),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            text: 'Enter your email address to receive a link to reset your password.',
            size: 14,
            color: AppColors.textColor2,
          ),
          SizedBox(height: 10),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
              hintStyle: TextStyle(color: AppColors.textColor1),
              labelStyle: TextStyle(color: AppColors.textColor2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.mainColor),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: AppText(text: 'Cancel', color: AppColors.textColor2),
        ),
        ElevatedButton(
          onPressed: () {
            // Logic for sending password reset email will go here.
            Navigator.of(context).pop();
          },
          child: AppText(text: 'Change Password', color: Colors.white),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: AppColors.mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}

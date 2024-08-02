import 'package:flutter/material.dart';
import 'package:tembelea_goma/misc/colors.dart';
import 'package:tembelea_goma/pages/register.dart';
import 'package:tembelea_goma/pages/tourists.dart';
import 'package:tembelea_goma/widgets/app_large_text.dart';


class UserTypeSelectionPage extends StatefulWidget {
  @override
  _UserTypeSelectionPageState createState() => _UserTypeSelectionPageState();
}

class _UserTypeSelectionPageState extends State<UserTypeSelectionPage> {
  String _loadingButton = ""; // "" indicates no button is loading, otherwise "Tourist" or "Guide"

  void navigateToRegisterPage(String userType) async {
    setState(() {
      _loadingButton = userType; // Set the current loading button
    });

    // Simulate a delay for loading
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _loadingButton = ""; // Reset loading state
    });

    if (userType == "Tourist") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterTouristPage(),
        ),
      );
    } else if (userType == "Guide") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterGuidePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/tshukudu.png"), // Replace with your background image
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppLargeText(
                      text: 'You will use the app as...',
                      color: AppColors.mainColor,
                      size: 24,
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _loadingButton.isEmpty
                                ? () {
                              navigateToRegisterPage("Tourist");
                            }
                                : null,
                            child: _loadingButton == "Tourist"
                                ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                                : AppLargeText(
                              text: 'A Tourist',
                              color: Colors.white,
                              size: 20,
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              foregroundColor: Colors.white, backgroundColor: AppColors.mainColor, // button color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _loadingButton.isEmpty
                                ? () {
                              navigateToRegisterPage("Guide");
                            }
                                : null,
                            child: _loadingButton == "Guide"
                                ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                                : AppLargeText(
                              text: 'A Guide',
                              color: Colors.white,
                              size: 20,
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              foregroundColor: Colors.white, backgroundColor: AppColors.mainColor, // button color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

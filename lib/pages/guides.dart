import 'package:flutter/material.dart';
import 'package:tembelea_goma/pages/profile.dart';
import 'package:tembelea_goma/widgets/app_large_text.dart';
import 'package:tembelea_goma/misc/colors.dart';
import 'package:tembelea_goma/pages/home_page.dart';
import '../widgets/apa_text.dart';

class TouristGuidePage extends StatefulWidget {
  final String locationName;

  TouristGuidePage({required this.locationName});

  @override
  _TouristGuidePageState createState() => _TouristGuidePageState();
}

class _TouristGuidePageState extends State<TouristGuidePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
          break;
        case 1:
        // Navigate to Explore page if available
          break;
        case 2:
        // Navigate to Notifications page if available
          break;
        case 3:
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ProfilePage()));
          break;
      }
    });
  }

  void _showChatDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ChatDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/tshukudu.png"),
                  fit: BoxFit.cover,
                ),
              ),
              height: 200,
              width: double.infinity,
              child: Container(
                color: Colors.black.withOpacity(0.3),
                child: Center(
                  child: AppLargeText(
                    text: 'Guides for ${widget.locationName}',
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Guides List
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: 5, // Example item count; replace with actual data length
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage("images/volcano.jpeg"),
                                backgroundColor: AppColors.mainColor.withOpacity(0.1),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      text: 'Clovis Mushagalusa',
                                      color: AppColors.bigTextColor,
                                      size: 18,
                                    ),
                                    SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Icon(Icons.star, color: AppColors.starColor, size: 16),
                                        Icon(Icons.star, color: AppColors.starColor, size: 16),
                                        Icon(Icons.star, color: AppColors.starColor, size: 16),
                                        Icon(Icons.star_half, color: AppColors.starColor, size: 16),
                                        Icon(Icons.star_border, color: AppColors.starColor, size: 16),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.more_vert, color: AppColors.textColor2),
                                onPressed: () {
                                  // Additional options can be implemented here
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          AppText(
                            text: 'Specializes in cultural tours and local cuisine. Fluent in English and French.',
                            color: AppColors.textColor1,
                            size: 14,
                          ),
                          SizedBox(height: 16),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: _showChatDialog,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AppText(text: 'Contact', color: Colors.white),
                                  SizedBox(width: 4),
                                  Icon(Icons.chat, color: Colors.white),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white, backgroundColor: AppColors.mainColor, // button color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
}

class ChatDialog extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: AppLargeText(text: 'Contact Guide', size: 20, color: AppColors.mainColor),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            text: 'Type your message below:',
            size: 14,
            color: AppColors.textColor2,
          ),
          SizedBox(height: 10),
          TextField(
            controller: _messageController,
            decoration: InputDecoration(
              hintText: 'Enter your message',
              hintStyle: TextStyle(color: AppColors.textColor1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.mainColor),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            maxLines: 4,
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
            // Logic for sending message will go here.
            Navigator.of(context).pop();
          },
          child: AppText(text: 'Send', color: Colors.white),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: AppColors.mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}

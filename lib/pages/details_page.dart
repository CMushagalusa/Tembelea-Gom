import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tembelea_goma/misc/colors.dart';
import 'package:tembelea_goma/pages/profile.dart';
import 'package:tembelea_goma/widgets/app_button.dart';
import 'package:tembelea_goma/widgets/app_large_text.dart';
import 'package:tembelea_goma/pages/guides.dart';
import 'package:tembelea_goma/pages/home_page.dart';
import '../widgets/apa_text.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int gottenStars = 4;
  int selectedIndex = -1;
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

  void _navigateToGuidesPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => TouristGuidePage(locationName: 'Tshukudu')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/tshukudu.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 42,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 220,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 250 - kBottomNavigationBarHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: "Tshukudu",
                            size: 24,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          AppLargeText(
                            text: "\$ 20",
                            size: 24,
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: AppColors.mainColor),
                          SizedBox(width: 5),
                          AppText(text: "Volcanoes District", color: AppColors.textColor1),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: index < gottenStars ? AppColors.starColor : AppColors.textColor2,
                              );
                            }),
                          ),
                          SizedBox(width: 10),
                          AppText(text: "(5.0)", color: AppColors.textColor2),
                        ],
                      ),
                      SizedBox(height: 20),
                      AppLargeText(text: "Pictures", color: Colors.black.withOpacity(0.8), size: 22),
                      SizedBox(height: 5),
                      AppText(text: "For the memory of your stay in Goma.", color: AppColors.mainTextColor),
                      SizedBox(height: 10),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10, bottom: 10),
                              child: AppButton(
                                size: 30,
                                color: selectedIndex == index ? Colors.white : Colors.black,
                                backgroundColor: selectedIndex == index ? Colors.black : AppColors.buttonBackground,
                                borderColor: selectedIndex == index ? Colors.black : AppColors.buttonBackground,
                                text: (index + 1).toString(),
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 15),
                      AppLargeText(text: "Description", color: Colors.black.withOpacity(0.8), size: 20),
                      SizedBox(height: 5),
                      AppText(
                        text: "Make your days here an unforgettable experience. Enjoy the breathtaking views, the vibrant culture, and the warm hospitality of the local people. Tshukudu is a place where you can explore nature, discover new traditions, and create lasting memories.",
                        color: AppColors.mainTextColor,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  AppButton(
                    size: 40,
                    color: AppColors.textColor1,
                    backgroundColor: Colors.white,
                    borderColor: AppColors.textColor1,
                    isIcon: true,
                    icon: Icons.favorite_border,
                  ),
                  SizedBox(width: 25),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _navigateToGuidesPage,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(text: 'Book a guide now', color: Colors.white),
                          SizedBox(width: 5),
                          Icon(Icons.arrow_forward, color: Colors.white),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: AppColors.mainColor,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
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

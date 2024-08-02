import 'package:flutter/material.dart';
import 'package:tembelea_goma/misc/colors.dart';
import 'package:tembelea_goma/pages/profile.dart';
import 'package:tembelea_goma/widgets/app_large_text.dart';
import 'package:tembelea_goma/pages/details_page.dart';
import '../widgets/apa_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "mulima.jpeg": "Mulima",
    "round.jpeg": "BDGL",
    "lave.jpeg": "Lave",
    "water.jpeg": "WaterFall"
  };
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
      }
    });
  }

  void _navigateToDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AppBar-like section
          Container(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.menu, size: 30, color: Colors.black54),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: Icon(Icons.home),
                                title: Text('Home'),
                                onTap: () {
                                  Navigator.pop(context);
                                  _onItemTapped(0);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.person),
                                title: Text('Profile'),
                                onTap: () {
                                  Navigator.pop(context);
                                  _onItemTapped(3);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.logout),
                                title: Text('Logout'),
                                onTap: () {
                                  // Implement logout functionality
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    // Profile picture click action (if needed)
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey.withOpacity(0.5),
                      image: DecorationImage(
                        image: AssetImage("images/tshukudu.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          // Discover Text
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discover", size: 28),
          ),
          SizedBox(height: 10),
          // TabBar section
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: _tabController,
              labelPadding: const EdgeInsets.symmetric(horizontal: 20),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicator:
              CircleTabIndicator(color: AppColors.mainColor, radius: 4),
              tabs: [
                Tab(text: "Places"),
                Tab(text: "Inspiration"),
                Tab(text: "Emotions"),
              ],
            ),
          ),
          // TabBarView section
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Places tab
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: _navigateToDetails,
                      child: Container(
                        margin: const EdgeInsets.only(right: 15, top: 10),
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage("images/tshukudu.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                // Inspiration tab with three pictures
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("images/nyiragongo.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("images/nyiraimage.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("images/volcano.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                // Emotions tab with a short poem
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: AppText(
                      text: 'In Goma, where the earth meets the skies,\n'
                          'Nature’s beauty in every sunrise.\n'
                          'Mountains stand tall, lakes serene,\n'
                          'In this city, dreams are seen.\n\n'
                          'Feel the warmth of the people’s embrace,\n'
                          'In Goma, find your place.\n',
                      size: 16,
                      color: AppColors.textColor1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Explore more section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: "Explore more", size: 22),
                AppText(text: "See all", color: AppColors.textColor1),
              ],
            ),
          ),
          SizedBox(height: 10),
          // Horizontal list of activities
          Container(
            height: 120,
            padding: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              itemCount: images.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: _navigateToDetails,
                  child: Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage(
                                  "images/" + images.keys.elementAt(index)),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        AppText(
                          text: images.values.elementAt(index),
                          color: AppColors.textColor2,
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

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2, configuration.size!.height);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}

import 'package:flutter/material.dart';
import 'explore_screen.dart';
import 'upload_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    DashboardScreen(), // Updated Home with Dashboard
    ExploreScreen(),
    UploadScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(24, 58, 55, 1),
        centerTitle: true, // Center the title in the AppBar
        elevation: 2, // Slight shadow for depth
      ),
      backgroundColor: Color.fromRGBO(1, 8, 12, 1),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(24, 58, 55, 1), // Updated background
        selectedItemColor: Color.fromRGBO(218, 169, 84, 1), // Gold color
        unselectedItemColor: Color.fromRGBO(146, 146, 146, 1),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.upload), label: 'Upload'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome to RetroPress!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(239, 214, 172, 1), // Gold color
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Your hub for timeless stories and modern experiences.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 20),

          // Profile Card
          Card(
            color: Color.fromRGBO(24, 58, 55, 1), // Match theme color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Profile Image
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/profile.jpg"),
                  ),
                  SizedBox(width: 16),

                  // Profile Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "John Doe", // Replace with dynamic username
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildProfileStat("Total Posts", "42"),
                            _buildProfileStat("Total Likes", "380"),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildProfileStat("Points", "1200"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20),

          // Grid Dashboard
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildDashboardTile(Icons.article, "Latest Stories"),
                _buildDashboardTile(Icons.favorite, "Favorites"),
                _buildDashboardTile(Icons.history, "Reading History"),
                _buildDashboardTile(Icons.settings, "Settings"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileStat(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
        Text(
          value,
          style: TextStyle(
            color: Color.fromRGBO(218, 169, 84, 1), // Gold color
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildDashboardTile(IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(24, 58, 55, 1), // Match app bar color
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
              size: 40, color: Color.fromRGBO(218, 169, 84, 1)), // Gold icons
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

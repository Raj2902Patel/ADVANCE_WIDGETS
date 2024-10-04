import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:week_4/pages/floating_action_button.dart';
import 'package:week_4/pages/page_four.dart';
import 'package:week_4/pages/page_one.dart';
import 'package:week_4/pages/page_three.dart';
import 'package:week_4/pages/page_two.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _listitem = [
    const PageOne(),
    const PageTwo(),
    const PageThree(),
    const PageFour(),
  ];

  void _update(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildListTile(int index, IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: _selectedIndex == index
              ? Colors.blue
              : Colors.black, // Change icon color when selected
        ),
        title: Text(
          title,
          style: TextStyle(
            color: _selectedIndex == index
                ? Colors.blue
                : Colors.black, // Change text color when selected
          ),
        ),
        tileColor: _selectedIndex == index
            ? Colors.grey.shade300
            : null, // Change background color when selected
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: _selectedIndex == index
                ? Colors.blue
                : Colors.transparent, // Apply border when selected
            width: 2,
          ),
          borderRadius:
              BorderRadius.circular(10), // Optional: rounding the tile
        ),
        onTap: () {
          setState(() {
            Navigator.of(context).pop();
            _update(index);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(
            // Use different colors for light and dark themes
            color: Colors.black),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
          ),
        ),
        elevation: 20.0,
        centerTitle: true,
        title: const Text(
          "App Bar",
          style: TextStyle(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print("Serch button clicked");
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {
              print("Notification button clicked");
            },
            icon: const Icon(
              Icons.notifications_active,
            ),
          ),
        ],
        toolbarHeight: 100,
        toolbarOpacity: 0.8,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 200,
              child: DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/profile_photo.png",
                          height: 80,
                          width: 100,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Theme(
                      data: ThemeData().copyWith(
                        dividerColor: Colors.transparent,
                        splashColor: Colors.transparent,
                      ),
                      child: const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Hello World!"),
                                  Text("hello@example.com"),
                                ],
                              ),
                              Icon(Icons.info)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildListTile(0, Icons.backup, "Home"),
            _buildListTile(1, Icons.folder_shared_rounded, "Favourite"),
            _buildListTile(2, Icons.backup, "Shopping"),
            _buildListTile(3, Icons.settings, "Settings"),
          ],
        ),
      ),
      body: _listitem[_selectedIndex],
      bottomNavigationBar: BottomNavyBar(
        showInactiveTitle: true,
        selectedIndex: _selectedIndex,
        showElevation: true,
        itemCornerRadius: 24,
        iconSize: 20,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _selectedIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Icons.home),
            title: _selectedIndex == 0 ? const Text("Home") : const Text(""),
            activeColor: Colors.grey,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.favorite),
            title:
                _selectedIndex == 1 ? const Text('Favourite') : const Text(""),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.shop),
            title: _selectedIndex == 2 ? const Text("Shop") : const Text(""),
            activeColor: Colors.redAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.settings),
            title: _selectedIndex == 3 ? const Text("Setting") : const Text(""),
            activeColor: Colors.deepOrangeAccent,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        focusColor: Colors.redAccent,
        elevation: 20.0,
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FloatingActionButtonPage(),
            ),
          );
        },
        child: const Icon(
          Icons.shopping_basket_outlined,
          color: Colors.black,
          size: 30.0,
        ),
      ),
    );
  }
}

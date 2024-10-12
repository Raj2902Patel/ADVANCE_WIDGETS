import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week_4/main_pages/setting.dart';
import 'package:week_4/main_pages/shopping.dart';
import 'package:week_4/pages/floating_action_button.dart';
import 'package:week_4/main_pages/home.dart';

import 'package:week_4/main_pages/favourite.dart';

import 'language_selection.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String name = '';

  _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  final List<Widget> _listitem = [
    const PageOne(),
    const PageTwo(),
    const ShoppingPage(),
    const SettingPage(),
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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
          title: name.isNotEmpty
              ? AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      "Welcome, $name!",
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 21.0,
                      ),
                    )
                  ],
                  repeatForever: true,
                  isRepeatingAnimation: true,
                )
              : Text(
                  tr("appbar"),
                  style: const TextStyle(fontSize: 22.0),
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
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: IconButton(
                onPressed: () {
                  print("Notification Button Clicked");
                },
                icon: const Icon(
                  Icons.notification_add,
                ),
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
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(tr("usr_name")),
                                    Text(tr("usr_email")),
                                  ],
                                ),
                                const Icon(
                                  Icons.person,
                                  size: 30,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildListTile(0, Icons.backup, tr("home_page")),
              _buildListTile(
                  1, Icons.folder_shared_rounded, tr("favourite_page")),
              _buildListTile(2, Icons.backup, tr("shop_page")),
              _buildListTile(3, Icons.settings, tr("setting_page")),
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: ListTile(
                  splashColor: Colors.transparent,
                  leading: const Icon(
                    Icons.language,
                    color: Colors.black,
                  ),
                  title: Text(tr("select_language")),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LanguageSelectionPage()),
                    );
                  },
                ),
              ),
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
              title:
                  _selectedIndex == 0 ? Text(tr("home_page")) : const Text(""),
              activeColor: Colors.blueGrey.withOpacity(0.6),
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.favorite),
              title: _selectedIndex == 1
                  ? Text(tr("favourite_page"))
                  : const Text(""),
              activeColor: Colors.cyan,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.shop),
              title:
                  _selectedIndex == 2 ? Text(tr("shop_page")) : const Text(""),
              activeColor: Colors.redAccent,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.settings),
              title: _selectedIndex == 3
                  ? Text(tr("setting_page"))
                  : const Text(""),
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
      ),
    );
  }
}

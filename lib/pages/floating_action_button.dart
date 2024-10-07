import 'package:flutter/material.dart';
import 'package:week_4/pages/page_four.dart';
import 'package:week_4/pages/page_one.dart';
import 'package:week_4/pages/page_two.dart';

class FloatingActionButtonPage extends StatefulWidget {
  const FloatingActionButtonPage({super.key});

  @override
  State<FloatingActionButtonPage> createState() =>
      _FloatingActionButtonPageState();
}

class _FloatingActionButtonPageState extends State<FloatingActionButtonPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.greenAccent.withOpacity(0.8),
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
            "Tab Bar",
            style: TextStyle(),
          ),
          actions: [
            IconButton(
              onPressed: () {
                print("Search button clicked");
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
          bottom: const TabBar(
            splashFactory: NoSplash.splashFactory,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            splashBorderRadius: BorderRadius.all(Radius.circular(30.0)),
            enableFeedback: false,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.favorite_outlined),
              ),
              Tab(
                icon: Icon(Icons.settings),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PageOne(),
            PageTwo(),
            PageFour(),
          ],
        ),
      ),
    );
  }
}

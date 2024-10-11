import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week_4/pages/text_form_field.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  String name = '';
  String number = '';
  String email = '';
  String password = '';

  _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '';
      number = prefs.getString('number') ?? '';
      email = prefs.getString('email') ?? '';
      password = prefs.getString("password") ?? '';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(0.6),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding for better layout
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors
                        .black, // Change this to your desired border color
                    width: 1.5, // Change the width of the border if needed
                  ),
                ),
                onPressed: () async {
                  final result = await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TextFormFieldPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.next_plan_outlined, color: Colors.black),
                label: const Text(
                  "Form Field!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

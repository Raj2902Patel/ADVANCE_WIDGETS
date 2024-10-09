import 'package:flutter/material.dart';
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
  String cpassword = '';

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
              Text(
                name.isNotEmpty ? "Name is $name" : '',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                number.isNotEmpty ? "Number is $number" : '',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                email.isNotEmpty ? "Email Address is $email" : '',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                password.isNotEmpty ? "Password is $password" : '',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors
                        .black, // Change this to your desired border color
                    width: 0.8, // Change the width of the border if needed
                  ),
                ),
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TextFormFieldPage(),
                    ),
                  );
                  if (result != null) {
                    setState(() {
                      name = result[
                          'name']; // Make sure result.name is correctly accessed
                      number = result['number'];
                      email = result['email'];
                      password = result['password'];
                      cpassword = result['cpassword'];
                    });
                    print(cpassword);
                  }
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

import 'package:flutter/material.dart';
import 'package:week_4/pages/text_form_field.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  String? _textFieldData;

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
                _textFieldData ?? 'No data entered',
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
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TextFormFieldPage(),
                    ),
                  );
                  if (result != null) {
                    setState(() {
                      _textFieldData = result;
                    });
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
              const SizedBox(
                  height: 16), // Add some space between button and text field
            ],
          ),
        ),
      ),
    );
  }
}

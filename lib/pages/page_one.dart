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
      backgroundColor: Colors.grey,
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
              OutlinedButton.icon(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TextFormFieldPage(),
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
                    color: Colors.brown,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
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

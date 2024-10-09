import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldPage extends StatefulWidget {
  const TextFormFieldPage({super.key});

  @override
  State<TextFormFieldPage> createState() => _TextFormFieldPageState();
}

class _TextFormFieldPageState extends State<TextFormFieldPage> {
  final _formkey = GlobalKey<FormState>();

  String? name;
  int? number;
  String? email;
  String? password;
  String? confirm;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Text Form Field"),
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 15.0, bottom: 15.0),
                child: Stack(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name is required Fields!";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        name = value;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _nameController,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        labelText: 'Name + Surname',
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                        errorStyle: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 8, // Adjust as needed for positioning
                      top: 0, // Adjust as needed for positioning
                      child: Text(
                        '*',
                        style: TextStyle(
                          color: Colors.red, // Color for the star symbol
                          fontSize: 24, // Size of the star symbol
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 15.0, bottom: 15.0),
                child: Stack(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Number is required Fields!";
                        } else if (value.length != 10) {
                          return "Enter a valid 10-digit number";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          number = int.parse(value!);
                        });
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _numberController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        prefixText: '+91 ',
                        prefixStyle: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        errorStyle: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        ),
                        prefixIcon: const Icon(Icons.numbers),
                        labelText: 'Phone Number',
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 8, // Adjust as needed for positioning
                      top: 0, // Adjust as needed for positioning
                      child: Text(
                        '*',
                        style: TextStyle(
                          color: Colors.red, // Color for the star symbol
                          fontSize: 24, // Size of the star symbol
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 15.0, bottom: 15.0),
                child: Stack(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required Fields!';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Please Enter A Valid Email Address';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        email = value;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        prefixStyle: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        errorStyle: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        ),
                        prefixIcon: const Icon(Icons.mail),
                        labelText: 'Mail Address',
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 8, // Adjust as needed for positioning
                      top: 0, // Adjust as needed for positioning
                      child: Text(
                        '*',
                        style: TextStyle(
                          color: Colors.red, // Color for the star symbol
                          fontSize: 24, // Size of the star symbol
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  right: 20.0,
                  left: 20.0,
                  bottom: 15.0,
                ),
                child: Stack(
                  children: [
                    TextFormField(
                      validator: (value) {
                        // Check if the password meets the criteria
                        if (value == null || value.isEmpty) {
                          return 'Password is required Fields!';
                        } else if (value.length < 8 || value.length > 12) {
                          return 'Password must be between 8 and 12 \ncharacters!';
                        } else if (!RegExp(
                                r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])')
                            .hasMatch(value)) {
                          return 'Password must contain at least one uppercase \nletter, one numeric character, and one \nspecial character!';
                        } else {
                          return null; // Clear the error if validation passes
                        }
                      },
                      onSaved: (value) {
                        password = value; // Save the password value
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true, // Hide the password input
                      controller:
                          _passwordController, // Your TextEditingController
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        prefixStyle: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        errorStyle: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 8, // Adjust as needed for positioning
                      top: 0, // Adjust as needed for positioning
                      child: Text(
                        '*',
                        style: TextStyle(
                          color: Colors.red, // Color for the star symbol
                          fontSize: 24, // Size of the star symbol
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  right: 20.0,
                  left: 20.0,
                  bottom: 15.0,
                ),
                child: Stack(
                  children: [
                    TextFormField(
                      validator: (value) {
                        // Check if the password meets the criteria
                        if (value == null || value.isEmpty) {
                          return 'Confirm Password is required Fields!';
                        } else if (_passwordController.text !=
                            _confirmController.text) {
                          return 'The passwords you entered do not match.\nPlease double-check and try again.';
                        }
                        return null;
                        // Return the error message
                      },
                      onSaved: (value) {
                        password = value; // Save the password value
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true, // Hide the password input
                      controller:
                          _confirmController, // Your TextEditingController
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        prefixStyle: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        errorStyle: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        labelText: 'Confirm Password',
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 8, // Adjust as needed for positioning
                      top: 0, // Adjust as needed for positioning
                      child: Text(
                        '*',
                        style: TextStyle(
                          color: Colors.red, // Color for the star symbol
                          fontSize: 24, // Size of the star symbol
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(0.5),
                ),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    Navigator.pop(context, {
                      'name': _nameController.text,
                      'number': _numberController.text,
                      'email': _emailController.text,
                      'password': _passwordController.text,
                      'cpassword': _confirmController.text,
                    });
                  }
                },
                child: const Text(
                  "Save!",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

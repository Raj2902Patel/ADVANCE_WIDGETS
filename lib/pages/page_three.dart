import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PageThree extends StatefulWidget {
  const PageThree({super.key});

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  final TimeOfDay _time = const TimeOfDay(hour: 10, minute: 15);
  final DateTime _date = DateTime.now();

  String _formatTime(TimeOfDay? time) {
    if (time == null) return '';

    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);

    // Use your desired format here. For example, hh:mm a for 12-hour format
    return MaterialLocalizations.of(context)
        .formatTimeOfDay(time, alwaysUse24HourFormat: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.withOpacity(0.7),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              color: Colors.white.withOpacity(0.7),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _timeController,
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.access_time_sharp,
                      color: Colors.black,
                    ),
                    label: const Text(
                      "Select Time",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blueGrey,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  readOnly: true,
                  onTap: () async {
                    TimeOfDay? newTime = await showTimePicker(
                        barrierDismissible: false,
                        context: context,
                        initialTime: _time,
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              primaryColor: Colors.blueGrey,
                              hintColor: Colors.blueAccent,
                              colorScheme: ColorScheme.light(
                                  primary: Colors.blueGrey,
                                  secondary: Colors.blue.withOpacity(0.5)),
                              buttonTheme: const ButtonThemeData(
                                textTheme: ButtonTextTheme.primary,
                              ),
                            ),
                            child: child ?? Container(),
                          );
                        });
                    if (newTime != null) {
                      String r = newTime.toString();
                      r = r.substring(10, 15);
                      _timeController.text = _formatTime(newTime);
                    }
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              color: Colors.white.withOpacity(0.7),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.date_range,
                      color: Colors.black,
                    ),
                    label: const Text(
                      "Select Date",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blueGrey,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? newDate = await showDatePicker(
                        barrierDismissible: false,
                        context: context,
                        initialDate: _date,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2025),
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              primaryColor: Colors.blueGrey,
                              hintColor: Colors.blueAccent,
                              colorScheme: const ColorScheme.light(
                                primary: Colors.blueGrey,
                                secondary: Colors.red,
                              ),
                              buttonTheme: const ButtonThemeData(
                                textTheme: ButtonTextTheme.primary,
                              ),
                              //
                            ),
                            child: child ?? Container(),
                          );
                        });
                    if (newDate != null) {
                      String formattedDate =
                          DateFormat('MMMM dd, yyyy').format(newDate);

                      _dateController.text = formattedDate;
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

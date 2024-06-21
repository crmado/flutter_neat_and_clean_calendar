// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Calendar Demo',
      home: CalendarScreen(),
    );
  }
}

class CalendarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarScreenState();
  }
}

class _CalendarScreenState extends State<CalendarScreen> {
  bool showEvents = true;

  List<NeatCleanCalendarEvent> _todaysEvents = [
    NeatCleanCalendarEvent(
      'Event A',
      startTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 0),
      endTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 0),
      description: 'A special event',
      color: Colors.blue[700],
      id: '1',
      googleCalendarEventId: String.fromEnvironment('googleCalendarEventId'),
    ),
  ];

  final List<NeatCleanCalendarEvent> _eventList = [
    NeatCleanCalendarEvent(
      'MultiDay Event A',
      description: 'test desc',
      startTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 0),
      endTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day + 2, 12, 0),
      color: Colors.orange,
      isMultiDay: true,
      id: '2',
      googleCalendarEventId: String.fromEnvironment('googleCalendarEventId'),
    ),
    NeatCleanCalendarEvent(
      'Event X',
      description: 'test desc',
      startTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 10, 30),
      endTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 11, 30),
      color: Colors.lightGreen,
      isAllDay: false,
      isDone: true,
      icon: 'assets/event1.jpg',
      wide: false,
      id: '3',
      googleCalendarEventId: String.fromEnvironment('googleCalendarEventId'),
    ),
    NeatCleanCalendarEvent(
      'Allday Event B',
      description: 'test desc',
      startTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day - 2, 14, 30),
      endTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day + 2, 17, 0),
      color: Colors.pink,
      isAllDay: true,
      icon: 'assets/event1.jpg',
      wide: false,
      id: '4',
      googleCalendarEventId: String.fromEnvironment('googleCalendarEventId'),
    ),
    NeatCleanCalendarEvent(
      'Normal Event D',
      description: 'test desc',
      startTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 14, 30),
      endTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 17, 0),
      color: Colors.indigo,
      wide: true,
      icon: 'assets/events.jpg',
      id: '5',
      googleCalendarEventId: String.fromEnvironment('googleCalendarEventId'),
    ),
    NeatCleanCalendarEvent(
      'Normal Event E',
      description: 'test desc',
      startTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 7, 45),
      endTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 9, 0),
      color: Colors.indigo,
      wide: true,
      icon: 'assets/profile.jpg',
      id: '6',
      googleCalendarEventId: String.fromEnvironment('googleCalendarEventId'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Force selection of today on first load, so that the list of today's events gets shown.
    _handleNewDate(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Calendar(
          startOnMonday: true,
          weekDays: ['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So'],
          eventsList: _eventList,
          isExpandable: true,
          eventDoneColor: Colors.deepPurple,
          selectedColor: Colors.blue,
          selectedTodayColor: Colors.green,
          todayColor: Colors.teal,
          eventColor: null,
          locale: 'de_DE',
          todayButtonText: 'Heute',
          allDayEventText: 'Ganztägig',
          multiDayEndText: 'Ende',
          isExpanded: true,
          expandableDateFormat: 'EEEE, dd. MMMM yyyy',
          onEventSelected: (value) {
            print('Event selected ${value.summary}');
          },
          onEventLongPressed: (value) {
            print('Event long pressed ${value.summary}');
          },
          // onMonthChanged: (value) {
          //   print('Month changed $value');
          // },
          onDateSelected: (value) {
            print('Date selected $value');
          },
          onRangeSelected: (value) {
            print('Range selected ${value.from} - ${value.to}');
          },
          datePickerType: DatePickerType.date,
          dayOfWeekStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w800, fontSize: 11),
          showEvents: showEvents,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showEvents = !showEvents;
          });
        },
        child: Icon(showEvents ? Icons.visibility_off : Icons.visibility),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _handleNewDate(date) {
    print('Date selected: $date');
  }
}

import 'package:flutter/material.dart';

enum MultiDaySegement {
  first,
  middle,
  last,
}

class NeatCleanCalendarEvent {
  String summary;
  String description;
  String location;
  DateTime startTime;
  DateTime endTime;
  Color? color;
  bool isAllDay;
  bool isMultiDay;
  MultiDaySegement? multiDaySegement;
  bool isDone;
  Map<String, dynamic>? metadata;
  String? icon;
  bool? wide = false;
  late final String id;

  NeatCleanCalendarEvent(
    this.summary, {
    this.description = '',
    this.location = '',
    required this.startTime,
    required this.endTime,
    this.color = Colors.blue,
    this.isAllDay = false,
    this.isMultiDay = false,
    this.isDone = false,
    multiDaySegement,
    this.metadata,
    this.icon,
    this.wide,
    required this.id,
  });

  factory NeatCleanCalendarEvent.fromMap(Map<String, dynamic> data) {
    final colorString = data['color'] as String;
    final color =
        Color(int.parse(colorString.substring(1, 7), radix: 16) + 0xFF000000);

    return NeatCleanCalendarEvent(data['summary'],
        description: data['description'],
        location: data['location'],
        startTime: DateTime.fromMillisecondsSinceEpoch(data['startTime']),
        endTime: DateTime.fromMillisecondsSinceEpoch(data['endTime']),
        color: color,
        isAllDay: data['isAllDay'],
        isMultiDay: data['isMultiDay'],
        isDone: data['isDone'],
        metadata: data['metadata'],
        icon: data['icon'],
        wide: data['wide'],
        id: data['id']);
  }
  Map<String, dynamic> toMap() {
    return {
      'summary': summary,
      'description': description,
      'location': location,
      'startTime': startTime.millisecondsSinceEpoch,
      'endTime': endTime.millisecondsSinceEpoch,
      'color': '#${color!.value.toRadixString(16).substring(2)}',
      'isAllDay': isAllDay,
      'isMultiDay': isMultiDay,
      'multiDaySegement': multiDaySegement?.toString().split('.').last,
      'isDone': isDone,
      'metadata': metadata,
      'icon': icon,
      'wide': wide,
      'id': id,
    };
  }
}

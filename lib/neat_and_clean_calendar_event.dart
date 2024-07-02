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
  late final String googleCalendarEventId;
  final String source;
  bool? googleCalendarDeleteStatus;

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
    required this.googleCalendarEventId,
    this.source = 'self',
    this.googleCalendarDeleteStatus = false,
  });

  factory NeatCleanCalendarEvent.fromMap(Map<String, dynamic> data) {
    final colorString = data['color'] as String;
    final color =
        Color(int.parse(colorString.substring(1, 7), radix: 16) + 0xFF000000);

    return NeatCleanCalendarEvent(data['summary'],
        description: data['description'],
        location: data['location'],
        startTime: data['startTime'],
        endTime: data['endTime'],
        color: color,
        isAllDay: data['isAllDay'],
        isMultiDay: data['isMultiDay'],
        isDone: data['isDone'],
        metadata: data['metadata'],
        icon: data['icon'],
        wide: data['wide'],
        id: data['id'],
        googleCalendarEventId: data['googleCalendarEventId'],
        source: data['source'],
        googleCalendarDeleteStatus: data['googleCalendarDeleteStatus']);
  }

  Map<String, dynamic> toMap() {
    return {
      'summary': summary,
      'description': description,
      'location': location,
      'startTime': startTime,
      'endTime': endTime,
      'color': '#${color!.value.toRadixString(16).substring(2)}',
      'isAllDay': isAllDay,
      'isMultiDay': isMultiDay,
      'multiDaySegement': multiDaySegement?.toString().split('.').last,
      'isDone': isDone,
      'metadata': metadata,
      'icon': icon,
      'wide': wide,
      'id': id,
      'googleCalendarEventId': googleCalendarEventId,
      'source': source,
      'googleCalendarDeleteStatus': googleCalendarDeleteStatus,
    };
  }

  // 新增的 toJson 方法
  Map<String, dynamic> toJson() {
    return {
      'summary': summary,
      'description': description,
      'location': location,
      'startTime': startTime,
      'endTime': endTime,
      'color': '#${color!.value.toRadixString(16).substring(2)}',
      'isAllDay': isAllDay,
      'isMultiDay': isMultiDay,
      'multiDaySegement': multiDaySegement?.toString().split('.').last,
      'isDone': isDone,
      'metadata': metadata,
      'icon': icon,
      'wide': wide,
      'id': id,
      'googleCalendarEventId': googleCalendarEventId,
      'source': source,
      'googleCalendarDeleteStatus': googleCalendarDeleteStatus,
    };
  }

  static empty() {
    return NeatCleanCalendarEvent('',
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        id: '',
        googleCalendarEventId: '',
        source: 'self',
        isAllDay: false);
  }
}

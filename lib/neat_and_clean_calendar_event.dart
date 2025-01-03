import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  String id;
  String googleCalendarEventId;
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
    if (data.isEmpty) {
      return NeatCleanCalendarEvent.empty();
    }
    String summary = data['summary'] ?? '';
    String description = data['description'] ?? '';
    String location = data['location'] ?? '';
    String? colorString;
    if (data['color'] != null) {
      colorString = data['color'] as String;
    }
    final color = (colorString != null)
        ? Color(int.parse(colorString.substring(1, 7), radix: 16) + 0xFF000000)
        : Colors.blue;

    DateTime parseDateTime(dynamic value) {
      if (value is Timestamp) {
        return value.toDate();
      } else if (value is String) {
        return DateTime.parse(value);
      }
      throw ArgumentError('Unsupported datetime type: ${value.runtimeType}');
    }

    return NeatCleanCalendarEvent(summary,
        description: description,
        location: location,
        startTime: parseDateTime(data['startTime']),
        endTime: parseDateTime(data['endTime']),
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
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
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
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
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

  // 添加一个更新 ID 的方法
  void updateId(String newId) {
    id = newId;
  }

  // 添加一个更新 googleCalendarEventId 的方法
  void updateGoogleCalendarEventId(String newId) {
    googleCalendarEventId = newId;
  }
}


import 'package:latlong2/latlong.dart';


class ExamScheduler {
  final String id;
  final String title;
  final DateTime dateTime;
  final LatLng location;
  final String locationName;

  ExamScheduler({
    required this.id,
    required this.title,
    required this.dateTime,
    required this.location,
    required this.locationName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'dateTime': dateTime.toIso8601String(),
      'latitude': location.latitude,
      'longitude': location.longitude,
      'locationName': locationName,
    };
  }

  factory ExamScheduler.fromMap(Map<String, dynamic> map) {
    return ExamScheduler(
      id: map['id'],
      title: map['title'],
      dateTime: DateTime.parse(map['dateTime']),
      location: LatLng(map['latitude'], map['longitude']),
      locationName: map['locationName'],
    );
  }
}

import 'package:flutter/foundation.dart';

import '../models/exam_scheduler.dart';

class ExamProvider with ChangeNotifier {
  List<ExamScheduler> _events = [];

  List<ExamScheduler> get events => _events;

  void addEvent(ExamScheduler event) {
    _events.add(event);
    notifyListeners();
  }

  void removeEvent(String eventId) {
    _events.removeWhere((event) => event.id == eventId);
    notifyListeners();
  }

  List<ExamScheduler> getEventsForDay(DateTime day) {
    return _events.where((event) =>
    event.dateTime.year == day.year &&
        event.dateTime.month == day.month &&
        event.dateTime.day == day.day).toList();
  }

  List<ExamScheduler> getAllEvents() {
    return _events;
  }
}
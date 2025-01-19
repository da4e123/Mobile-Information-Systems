import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lab4/providers/exam_provider.dart';

class EventsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Преглед на испити'),
      ),
      body: Consumer<ExamProvider>(
        builder: (context, examProvider, child) {
          final events = examProvider.getAllEvents();
          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return Card(
                color: Colors.blue[500],
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                elevation: 4.0,
                child: ListTile(
                  contentPadding: EdgeInsets.all(16.0),
                  title: Text(
                    event.title,
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    '${event.dateTime.toString()} - ${event.location}',
                    style: TextStyle(color: Colors.white70),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      examProvider.removeEvent(event.id);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Настанот е избришан')),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

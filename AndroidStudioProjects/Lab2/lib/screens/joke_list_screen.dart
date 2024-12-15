import 'package:flutter/material.dart';
import 'package:lab2/services/api_services.dart';
import 'package:lab2/models/joke_model.dart';

import '../widgets/joke_list_item.dart';

class JokeListScreen extends StatefulWidget {
  final String type;

  JokeListScreen({required this.type});

  @override
  _JokeListScreenState createState() => _JokeListScreenState();
}

class _JokeListScreenState extends State<JokeListScreen> {
  late Future<List<Joke>> _futureJokes;

  @override
  void initState() {
    super.initState();
    _futureJokes = ApiServices.fetchJokesByType(widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.type.toUpperCase()} Jokes'),
      ),
      body: FutureBuilder<List<Joke>>(
        future: _futureJokes,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error loading jokes'));
          }
          final jokes = snapshot.data!;
          return ListView.builder(
            itemCount: jokes.length,
            itemBuilder: (ctx, index) {
              return JokeListItem(joke: jokes[index]);
            },
          );
        },
      ),
    );
  }
}
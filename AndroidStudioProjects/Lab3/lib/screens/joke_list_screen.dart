import 'package:flutter/material.dart';
import 'package:lab2/services/api_services.dart';
import 'package:lab2/models/joke_model.dart';

import '../widgets/joke_list_item.dart';

class JokeListScreen extends StatefulWidget {
  final String type;
  final Function(Joke) onAddFavorite;
  final Function(Joke) onRemoveFavorite;

  JokeListScreen({
    Key ? key,
    required this.onAddFavorite,
    required this.onRemoveFavorite,
    required this.type
  }) : super(key: key);

  @override
  _JokeListScreenState createState() => _JokeListScreenState();
}

class _JokeListScreenState extends State<JokeListScreen> {
  late Future<List<Joke>> _futureJokes;
  final ApiServices _apiServices = ApiServices();
  List<Joke> jokes = [];

  @override
  void initState() {
    super.initState();
    // _futureJokes = ApiServices.fetchJokesByType(widget.type);
    _loadJokes();
  }

  Future<void> _loadJokes() async {
    try {
      final loadedJokes = await _apiServices.getJokesByType(widget.type);
      setState(() {
        jokes = loadedJokes;
      });
    } catch (e) {
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }
  }

  void _toggleFavorite(Joke joke){
    setState(() {
      joke.isFavorite = !joke.isFavorite;
      if(joke.isFavorite) {
        widget.onAddFavorite(joke);
      } else {
        widget.onRemoveFavorite(joke);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.type} Jokes'),
      ),
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          final joke = jokes[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ExpansionTile(
              title: Text(joke.setup),
              trailing: IconButton(
                icon: Icon(
                  joke.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: joke.isFavorite ? Colors.red : null,
                ),
                onPressed: () => _toggleFavorite(joke),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    joke.punchline,
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/joke_model.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Joke> favoriteJokes;
  final Function(Joke) onRemoveFavorite;

  const FavoritesScreen({
    Key ? key,
    required this.favoriteJokes,
    required this.onRemoveFavorite,

  }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Jokes'),
      ),
      body: favoriteJokes.isEmpty
        ? const Center(
        child: Text('No favorite jokes yet!'),
      )
          : ListView.builder(
          itemCount: favoriteJokes.length,
          itemBuilder: (context, index) {
        final joke = favoriteJokes[index];
        return Card(
          margin: const EdgeInsets.all(8),
          child: ExpansionTile(
            title: Text(joke.setup),
            trailing: IconButton(onPressed: () => onRemoveFavorite(joke),
            icon: const Icon(Icons.favorite, color: Colors.red),
      ),
    children: [
      Padding(padding: const EdgeInsets.all(16),
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
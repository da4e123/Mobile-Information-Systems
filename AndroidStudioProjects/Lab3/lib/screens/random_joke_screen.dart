//
//
// import 'package:flutter/material.dart';
// import 'package:lab2/services/api_services.dart';
// import 'package:lab2/models/joke_model.dart';
//
// class RandomJokeScreen extends StatefulWidget {
//   static const routeName = '/random-joke';
//
//   @override
//   _RandomJokeScreenState createState() => _RandomJokeScreenState();
// }
//
// class _RandomJokeScreenState extends State<RandomJokeScreen> {
//   late Future<Joke> _futureJoke;
//
//   @override
//   void initState() {
//     super.initState();
//     _futureJoke = ApiServices().getRandomJoke();
//   }
//
//   void _reloadJoke() {
//     setState(() {
//       _futureJoke = ApiServices().getRandomJoke();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Random Joke'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.refresh),
//             onPressed: _reloadJoke,
//             tooltip: 'New Random Joke',
//           ),
//         ],
//       ),
//       body: FutureBuilder<Joke>(
//         future: _futureJoke,
//         builder: (ctx, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text('Error loading random joke'));
//           }
//           final joke = snapshot.data!;
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 Text(
//                   joke.setup,
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   joke.punchline,
//                   style: TextStyle(fontSize: 18),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:lab2/services/api_services.dart';
// import 'package:lab2/models/joke_model.dart';
//
// class RandomJokeScreen extends StatefulWidget {
//   static const routeName = '/random-joke';
//
//   @override
//   _RandomJokeScreenState createState() => _RandomJokeScreenState();
// }
//
// class _RandomJokeScreenState extends State<RandomJokeScreen> {
//   late Future<Joke> _futureJoke;
//   final List<Joke> _favoriteJokes = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _futureJoke = ApiServices().getRandomJoke();
//   }
//
//   void _reloadJoke() {
//     setState(() {
//       _futureJoke = ApiServices().getRandomJoke();
//     });
//   }
//
//   void _addToFavorites(Joke joke) {
//     setState(() {
//       if (!_favoriteJokes.any((j) => j.id == joke.id)) {
//         _favoriteJokes.add(joke);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Added to favorites!')),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Joke is already in favorites!')),
//         );
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Random Joke'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.refresh),
//             onPressed: _reloadJoke,
//             tooltip: 'New Random Joke',
//           ),
//         ],
//       ),
//       body: FutureBuilder<Joke>(
//         future: _futureJoke,
//         builder: (ctx, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text('Error loading random joke'));
//           }
//           final joke = snapshot.data!;
//           return Center(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Card(
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         joke.setup,
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(height: 20),
//                       Text(
//                         joke.punchline,
//                         style: TextStyle(
//                           fontSize: 18,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(height: 20),
//                       ElevatedButton.icon(
//                         onPressed: () => _addToFavorites(joke),
//                         icon: Icon(Icons.favorite),
//                         label: Text('Add to Favorites'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../models/joke_model.dart';

class RandomJokeScreen extends StatefulWidget {
  final Function(Joke) onAddToFavorites;

  const RandomJokeScreen({Key? key, required this.onAddToFavorites}) : super(key: key);

  @override
  _RandomJokeScreenState createState() => _RandomJokeScreenState();
}

class _RandomJokeScreenState extends State<RandomJokeScreen> {
  late Future<Joke> _futureJoke;

  @override
  void initState() {
    super.initState();
    _futureJoke = ApiServices().getRandomJoke();
  }

  void _reloadJoke() {
    setState(() {
      _futureJoke = ApiServices().getRandomJoke();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Joke'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _reloadJoke,
            tooltip: 'New Random Joke',
          ),
        ],
      ),
      body: FutureBuilder<Joke>(
        future: _futureJoke,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading random joke'));
          }
          final joke = snapshot.data!;
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        joke.setup,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        joke.punchline,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () {
                          widget.onAddToFavorites(joke);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Added to Favorites!')),
                          );
                        },
                        icon: const Icon(Icons.favorite),
                        label: const Text('Add to Favorites'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

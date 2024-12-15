import 'package:flutter/material.dart';
import 'package:lab2/screens/random_joke_screen.dart';
import 'package:lab2/services/api_services.dart';
import 'package:lab2/models/joke_type.dart';
import '../widgets/category_cart.dart';
import 'joke_list_screen.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<String>> _futureTypes;

  @override
  void initState() {
    super.initState();
    _futureTypes = ApiServices.fetchJokeTypes();
  }

  void _goToRandomJoke() {
    Navigator.pushNamed(context,  RandomJokeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Joke Categories'),
        actions: [
          IconButton(
            icon: Icon(Icons.casino),
            onPressed: _goToRandomJoke,
            tooltip: 'Random Joke',
          ),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: _futureTypes,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error loading categories: ${snapshot.error}'));
          }
          final types = snapshot.data!;
          return ListView.builder(
            itemCount: types.length,
            itemBuilder: (ctx, index) {
              return CategoryCard(
                category: types[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => JokeListScreen(type: types[index]),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
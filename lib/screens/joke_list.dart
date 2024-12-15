import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../service/api_services.dart';
import '../widgets/joke/joke_tile.dart';

class JokesListScreen extends StatelessWidget {
  final String jokeType;
  const JokesListScreen({super.key, required this.jokeType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$jokeType jokes'),
      ),
      body: FutureBuilder<List<Joke>>(
        future: ApiServices.getJokesByType(jokeType),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<Joke> jokes = snapshot.data!;
            return ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                return JokeTile(joke: jokes[index]);
              },
            );
          } else {
            return const Center(child: Text('No jokes available!'));
          }
        },
      ),
    );
  }
}

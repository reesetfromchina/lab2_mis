import 'package:flutter/material.dart';
import '../../models/joke.dart';

class JokeTile extends StatelessWidget {
  final Joke joke;

  const JokeTile({super.key, required this.joke});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(joke.setup),
      subtitle: Text(joke.punchline),
    );
  }
}

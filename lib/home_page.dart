// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinder_ui/viewmodel.dart';
import 'package:tinder_ui/tinder_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(context) {
    List<Color> colors = [Colors.deepPurple, Colors.red, Colors.blue];
    final viewmodel = Provider.of<TinkerViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Swipe Cards"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              viewmodel.resetSwipeItems();
            },
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          height: 400,
          width: 300,
          child: TinderCard(colors: colors),
        ),
      ),
    );
  }
}

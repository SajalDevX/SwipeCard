import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:tinder_ui/viewmodel.dart';

class TinderCard extends StatelessWidget {
  final List<Color> colors;
  const TinderCard({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<TinkerViewModel>(context);
    final items = viewmodel.swipeItems;

    // Ensure the number of colors is sufficient
    assert(colors.length >= items.length, "Not enough colors for swipe items");

    MatchEngine matchEngine = MatchEngine(swipeItems: items);

    return SwipeCards(
      matchEngine: matchEngine,
      upSwipeAllowed: false,
      onStackFinished: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Stack Finished")),
        );
      },
      itemBuilder: (BuildContext context, int index) {
        Color cardColor = colors[index % colors.length];

        return Card(
          color: cardColor,
          child: Center(
            child: Text(
              items[index].content.toString(),
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}

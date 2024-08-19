import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';

class TinkerViewModel extends ChangeNotifier {
  List<SwipeItem> swipeItems = [
    SwipeItem(content: "Card 1"),
    SwipeItem(content: "Card 2"),
    SwipeItem(content: "Card 3"),
  ];

  MatchEngine _matchEngine;

  TinkerViewModel() : _matchEngine = MatchEngine(swipeItems: []);

  MatchEngine get matchEngine => _matchEngine;

  void initializeSwipeItems(List<SwipeItem> items) {
    swipeItems = items;
    _matchEngine = MatchEngine(swipeItems: swipeItems);
    notifyListeners();
  }

  void resetSwipeItems() {
    swipeItems = [
      SwipeItem(content: "Card 1"),
      SwipeItem(content: "Card 2"),
      SwipeItem(content: "Card 3"),
    ];
    _matchEngine = MatchEngine(swipeItems: swipeItems);
    notifyListeners();
  }

  void addSwipeItem(SwipeItem item) {
    swipeItems.add(item);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:store_demo/shared/cards.dart';
import 'package:store_demo/services/services.dart';

class CollectionScreen extends StatelessWidget {
  CollectionScreen({Key? key}) : super(key: key);

  final _singleton = Singleton();

  @override
  Widget build(BuildContext context) {
    // extract cards from singleton's userData
    Map<String, dynamic> cards = Map<String, dynamic>.from(
        _singleton.userData?['collection']['cards'] as Map<String, dynamic>);

    // Generate a list of widgets from the 'cards' map
    List<Widget> cardWidgets = cards.entries.map<Widget>((entry) {
      String id = entry.key;
      return CardDisplay(
        cardInfo: cards[id]!,
        id: id,
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 96, 59, 26),
        title: const Text("Collection"),
      ),
      body: Column(
        children: [
          // grid of cards, 2 columns
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              children: cardWidgets,
            ),
          ),
        ],
      ),
    );
  }
}

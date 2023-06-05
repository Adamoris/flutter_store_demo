import 'package:flutter/material.dart';
import 'package:store_demo/size_config.dart';
import 'package:store_demo/services/services.dart';

var cards = {
  "card1": {
    "name": "Isolde Thundersong",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "image": "card1.jpg",
    "rarity": "common",
    "type": "card",
    "quantity": 1,
  },
  "card2": {
    "name": "Eladra Moonshadow",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "image": "card2.jpg",
    "rarity": "common",
    "type": "card",
    "quantity": 1,
  },
  "card3": {
    "name": "Tharivol Windrider",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "image": "card3.jpg",
    "rarity": "common",
    "type": "card",
    "quantity": 1,
  },
  "card4": {
    "name": "Kaelis Emberfall",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "image": "card4.jpg",
    "rarity": "common",
    "type": "card",
    "quantity": 1,
  },
  "card5": {
    "name": "Valyndra Swiftgale",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "image": "card5.jpg",
    "rarity": "common",
    "type": "card",
    "quantity": 1,
  },
  "card6": {
    "name": "Phaedra Starflame",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "image": "card6.jpg",
    "rarity": "common",
    "type": "card",
    "quantity": 1,
  },
  "card7": {
    "name": "Galadriel Frostveil",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "image": "card7.jpg",
    "rarity": "common",
    "type": "card",
    "quantity": 1,
  },
  "card8": {
    "name": "Yllarial Stormwhisper",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "image": "card8.jpg",
    "rarity": "common",
    "type": "card",
    "quantity": 1,
  },
};

class CardDisplay extends StatelessWidget {
  CardDisplay(
      {super.key,
      this.buyable = false,
      required this.cardInfo,
      required this.id});
  final Map<String, dynamic> cardInfo;
  final String id;
  final bool buyable;

  final _singleton = Singleton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 150,
      child: Card(
        color: Color.fromARGB(255, 173, 144, 96),
        child: InkWell(
          onTap: () {
            if (buyable && _singleton.userData?["coins"] >= 5) {
              print("Buyable");
              Auth().purchaseCard(id, 5);
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Stack(children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(10.0), // adjust corner radius here
                  child: Image(
                    image: AssetImage("assets/${cardInfo['image']}"),
                    width: SizeConfig.blockSizeHorizontal! * 45,
                    // height: 150,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(139, 0, 0, 0),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "5",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  // right: 0,
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal! * 45,
                    height: 175,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.0),
                          ],
                          stops: const [
                            0.3,
                            0.9,
                          ]),
                      borderRadius: const BorderRadius.only(
                        // topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        // topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          cardInfo['name'].toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          cardInfo['description'].toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

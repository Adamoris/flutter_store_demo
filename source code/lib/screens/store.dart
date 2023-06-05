import 'package:store_demo/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:store_demo/size_config.dart';
import 'package:store_demo/services/services.dart';

// function converting camel case to title case with spaces
String toTitleCase(String text) {
  if (text.length <= 1) {
    return text.toUpperCase();
  }
  String name = text[0].toUpperCase() + text.substring(1);

  // add spaces before capital letters
  for (int i = 1; i < name.length; i++) {
    if (name[i] == name[i].toUpperCase()) {
      name = "${name.substring(0, i)} ${name.substring(i)}";
      i++;
    }
  }

  return name;
}

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 96, 59, 26),
          title: const Text("Shop"),
          actions: [
            Currency(),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Featured",
              ),
              Tab(
                text: "Skins",
              ),
              Tab(
                text: "Cards",
              ),
              Tab(
                text: "Emotes",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          FeaturedSection(),
          SkinsSection(),
          CardsSection(),
          EmotesSection(),
        ]),
      ),
    );
  }
}

class FeaturedSection extends StatelessWidget {
  FeaturedSection({super.key});

  final _singleton = Singleton();

  Widget featuredCard(
      String title, String description, String price, String image) {
    return SizedBox(
      width: SizeConfig.blockSizeHorizontal! * 90,
      height: SizeConfig.blockSizeVertical! * 40,
      child: Card(
        color: Color.fromARGB(255, 65, 65, 65),
        child: InkWell(
          onTap: () {
            print("Attempting to buy $title");
          },
          child: Column(
            children: [
              Stack(children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(10.0), // adjust corner radius here
                  child: Image(
                    image: AssetImage("assets/$image"),
                    width: SizeConfig.blockSizeHorizontal! * 100,
                    // height: 150,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(139, 0, 0, 0),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      description,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
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
                    child: Text(
                      price,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ]),
              const SizedBox(height: 10),
              Text(toTitleCase(title),
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              // Text(description),
              // Text(price),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Extract the 'featured' map
    Map<String, dynamic> featured =
        Map<String, dynamic>.from(_singleton.storeData?['featured']);

    // Generate a list of widgets from the 'featured' map
    List<Widget> featuredWidgets = featured.entries.map<Widget>((entry) {
      String title = entry.key;
      String description = entry.value['description'];
      String price = entry.value['price'].toString();
      String image = entry.value['image'];
      return featuredCard(title, description, price, image);
    }).toList();

    return ListView(children: featuredWidgets);
  }
}

class SkinsSection extends StatelessWidget {
  const SkinsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CardsSection extends StatelessWidget {
  const CardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // grid of cards, 2 columns
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            children: [
              CardDisplay(
                  cardInfo: cards["card1"]!, buyable: true, id: "card1"),
              CardDisplay(
                  cardInfo: cards["card2"]!, buyable: true, id: "card2"),
              CardDisplay(
                  cardInfo: cards["card3"]!, buyable: true, id: "card3"),
              CardDisplay(
                  cardInfo: cards["card4"]!, buyable: true, id: "card4"),
              CardDisplay(
                  cardInfo: cards["card5"]!, buyable: true, id: "card5"),
              CardDisplay(
                  cardInfo: cards["card6"]!, buyable: true, id: "card6"),
              CardDisplay(
                  cardInfo: cards["card7"]!, buyable: true, id: "card7"),
              CardDisplay(
                  cardInfo: cards["card8"]!, buyable: true, id: "card8"),
            ],
          ),
        ),
      ],
    );
  }
}

class EmotesSection extends StatelessWidget {
  const EmotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

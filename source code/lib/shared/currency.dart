import 'package:flutter/material.dart';
import 'package:store_demo/size_config.dart';
import 'package:store_demo/services/services.dart';

// return a widget that displays a currency amount, a plus button, and a coin icon
class Currency extends StatelessWidget {
  Currency({super.key});

  final _singleton = Singleton();

  // return a popup with a grid showing the different currency amounts that can be purchased
  void _showCurrencyPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Purchase Currency"),
          backgroundColor: const Color.fromARGB(255, 240, 217, 181),
          content: SizedBox(
            width: SizeConfig.blockSizeHorizontal! * 90,
            height: SizeConfig.blockSizeVertical! * 80,
            child: ListView(
              children: const [
                PurchaseCurrency(cost: 199, amount: 3),
                PurchaseCurrency(cost: 599, amount: 11),
                PurchaseCurrency(cost: 1299, amount: 25),
                PurchaseCurrency(cost: 2699, amount: 54),
                PurchaseCurrency(cost: 3999, amount: 83),
                PurchaseCurrency(cost: 4899, amount: 110),
                PurchaseCurrency(cost: 7499, amount: 170),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.blockSizeHorizontal! * 30,
      child: Card(
        color: Colors.grey.shade700,
        child: InkWell(
          onTap: () {
            print("Currency tapped!");
            _showCurrencyPopup(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Image(
                image: AssetImage('assets/coin.png'),
                width: 30,
                height: 30,
              ),
              Text(
                _singleton.userData!["coins"].toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const Icon(
                Icons.add_box,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PurchaseCurrency extends StatelessWidget {
  const PurchaseCurrency({super.key, required this.cost, required this.amount});
  final int cost;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.blockSizeVertical! * 10,
      child: Card(
          color: const Color.fromARGB(255, 96, 59, 26),
          child: InkWell(
            onTap: () {
              print("Attempting to buy $amount coins for $cost!");

              // add amount coins to user's coins on firestore
              Auth().addCoins(amount).then(
                    (value) => Navigator.pop(context),
                  );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(
                      image: const AssetImage('assets/coin.png'),
                      width: SizeConfig.blockSizeVertical! * 8,
                      height: SizeConfig.blockSizeVertical! * 8,
                    ),
                    Text(
                      amount.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ],
                ),
                SizedBox(width: SizeConfig.blockSizeVertical! * 3),
                Text(
                  "\$${cost / 100}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                SizedBox(width: SizeConfig.blockSizeVertical! * 1)
              ],
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:store_demo/size_config.dart';
import 'package:store_demo/services/services.dart';
import 'package:store_demo/shared/shared.dart';

class TitleScreen extends StatelessWidget {
  TitleScreen({super.key});

  final _singleton = Singleton();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(height: SizeConfig.blockSizeVertical! * 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Currency()],
            ),
            const Text("Card Game",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 240, 217, 181))),
            SizedBox(height: SizeConfig.blockSizeVertical),
            SizedBox(
                width: SizeConfig.blockSizeHorizontal! * 75,
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor:
                            const Color.fromARGB(255, 240, 217, 181)),
                    onPressed: () {
                      // Navigator.pushNamed(context, '/matchmakingScreen');
                    },
                    child: const Text('Play',
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 96, 59, 26))))),
            SizedBox(
                width: SizeConfig.blockSizeHorizontal! * 75,
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor:
                            const Color.fromARGB(255, 240, 217, 181)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/collectionScreen');
                    },
                    child: const Text('Collection',
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 96, 59, 26))))),
            SizedBox(
                width: SizeConfig.blockSizeHorizontal! * 75,
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor:
                            const Color.fromARGB(255, 240, 217, 181)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/shopScreen');
                    },
                    child: const Text('Store',
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 96, 59, 26))))),
            SizedBox(
                width: SizeConfig.blockSizeHorizontal! * 75,
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor:
                            const Color.fromARGB(255, 240, 217, 181)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/settingScreen');
                    },
                    child: const Text('Settings',
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 96, 59, 26))))),
            SizedBox(height: SizeConfig.blockSizeVertical),
            SizedBox(
              height: 150,
              width: SizeConfig.blockSizeHorizontal! * 80,
              child: Card(
                color: const Color.fromARGB(255, 74, 70, 72),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: SizeConfig.blockSizeHorizontal! * 5),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 45, 41, 43),
                            shape: BoxShape.circle),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal! * 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(_singleton.username,
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 240, 217, 181))),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical),
          ],
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:store_demo/size_config.dart';
import 'package:store_demo/services/services.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Settings",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 240, 217, 181))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: SizeConfig.blockSizeHorizontal! * 40,
                      height: 60,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor:
                                  const Color.fromARGB(255, 240, 217, 181)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Back',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 96, 59, 26))))),
                  SizedBox(width: SizeConfig.blockSizeHorizontal! * 3),
                  SizedBox(
                      width: SizeConfig.blockSizeHorizontal! * 40,
                      height: 60,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor:
                                  const Color.fromARGB(255, 240, 217, 181)),
                          onPressed: () {
                            Auth().logout().then((value) {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/', (route) => false);
                            });
                          },
                          child: const Text('Logout',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 96, 59, 26))))),
                ],
              )
            ]),
      ),
    );
  }
}

import 'package:firebase_database/firebase_database.dart';
import 'package:store_demo/screens/login.dart';
import 'package:store_demo/screens/title.dart';
import 'package:flutter/material.dart';
import 'package:store_demo/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'size_config.dart';

class AuthChecker extends StatelessWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final _singleton = Singleton();

    if (Auth().user == null) {
      return LoginScreen();
    }

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("users")
          .doc(Auth().user?.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!["username"] == null) {
            return LoginScreen();
          } else {
            Auth().getStore().then((value) {
              _singleton.storeData =
                  Map<String, dynamic>.from(value.snapshot.value);
            });
            print(snapshot.data!["username"]);
            _singleton.username = snapshot.data!["username"];
            _singleton.userData = snapshot.data!.data() as Map<String, dynamic>;
            return TitleScreen();
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

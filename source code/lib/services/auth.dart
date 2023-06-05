import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:store_demo/services/services.dart';
import 'package:store_demo/shared/shared.dart';

class Auth {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;

  final _singleton = Singleton();

  Future login(loginUsername, loginPassword) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: loginUsername, password: loginPassword);
      return null;
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        print('username unfound'); // TODO: replace with UI element
      } else if (error.code == 'wrong-password') {
        print('wrong password');
      }
      return error.message;
    }
  }

  Future register(creationEmail, creationPassword, username) async {
    try {
      final accountCreateAttempt = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: creationEmail, password: creationPassword);
      User? user = accountCreateAttempt.user;
      user?.updateDisplayName(username);
      _singleton.username = username;

      // write initial save data to firestore (replace with cloud functions later)
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection("users");
      // replace with card code later
      collectionReference.doc(user!.uid).set({
        "username": username,
        "coins": 0,
        "collection": {
          "cards": {
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
          }
        }
      });

      return null;
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        print('password is too weak');
      } else if (error.code == 'email-already-in-use') {
        print('email is already in use');
      } else if (error.code == 'invalid-email') {
        print('this email address does not exist');
      }
      return error.message;
    }
  }

  Future getStore() {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref().child("store");
    return databaseReference.once();
  }

  Future addCoins(int coins) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("users");
    await collectionReference
        .doc(user!.uid)
        .update({"coins": FieldValue.increment(coins)});
    return null;
  }

  Future purchaseCard(String cardName, int cardCost) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("users");
    await collectionReference
        .doc(user!.uid)
        .update({"coins": FieldValue.increment(-cardCost)});

    // check if card exists in collection
    if (_singleton.userData?["collection"]["cards"][cardName] == null) {
      await collectionReference.doc(user!.uid).update({
        "collection.cards.$cardName": {
          "name": cards[cardName]?["name"],
          "description": cards[cardName]?["description"],
          "image": cards[cardName]?["image"],
          "rarity": cards[cardName]?["rarity"],
          "type": "card",
          "quantity": 1,
        }
      });
    } else {
      await collectionReference.doc(user!.uid).update(
          {"collection.cards.$cardName.quantity": FieldValue.increment(1)});
    }
    return null;
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
    return null;
  }

  Future verifyEmail() async {
    // return;
    if (user != null && !user!.emailVerified) {
      print("User was sent an email!");
      await user?.sendEmailVerification();
      return null;
    } else if (user == null) {
      print("Hmm, user does not seem to exist");
      return null;
    } else {
      print(user?.emailVerified);
      return user;
    }
  }

  // forgot password
  Future forgotPassword(email) async {
    try {
      print("Attempting to send an email to $email");
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return null;
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-email') {
        print('this email address does not exist');
      } else if (error.code == 'user-not-found') {
        print('this email address does not exist');
      }
      return error.message;
    }
  }
}

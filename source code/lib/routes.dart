import 'auth_checker.dart';
import 'package:store_demo/screens/login.dart';
import 'package:store_demo/screens/register.dart';
import 'package:store_demo/screens/title.dart';
import 'package:store_demo/screens/collection.dart';
import 'package:store_demo/screens/store.dart';
import 'package:store_demo/screens/settings.dart';

var screenRoutes = {
  '/': (context) => const AuthChecker(),
  '/loginScreen': (context) => const LoginScreen(),
  '/registerScreen': (context) => const RegisterScreen(),
  '/titleScreen': (context) => TitleScreen(),
  '/collectionScreen': (context) => CollectionScreen(),
  '/shopScreen': (context) => const ShopScreen(),
  '/settingScreen': (context) => const SettingScreen(),
};

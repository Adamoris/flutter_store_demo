class Singleton {
  static final Singleton _instance = Singleton._internal();

  // passes the instantiation to the _instance object
  factory Singleton() => _instance;

  //initialize variables in here
  Singleton._internal();

  String username = "Player";

  Map<String, dynamic>? storeData;

  String? currentGame;
  Map<String, dynamic>? userData;
}

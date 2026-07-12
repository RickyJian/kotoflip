class Constant {
  Constant._internal();

  static final Constant _instance = Constant._internal();

  factory Constant() => _instance;

  // global
  final String appName = 'kotoflip';
  final String buttonAdd = 'Add';

  // create cards page
  final String newCardPageAppName = 'New Card Page';
}

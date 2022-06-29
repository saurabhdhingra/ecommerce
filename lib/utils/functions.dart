import 'package:shared_preferences/shared_preferences.dart';

String creditCard(String creditCardNumber) {
  List numbers = creditCardNumber.split('');
  String firstFour = '';
  String lastFour = '';
  for (int i = 0; i < 4; i++) {
    firstFour += numbers[i];
    lastFour += numbers[12 - i];
  }

  return '$firstFour **** **** ${lastFour.split('').reversed.join()}';
}

getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? value = prefs.getString('token');
  return value ?? 'skip';
}

getUserId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? value = prefs.getInt('userId');
  return value ?? 0;
}

getIsLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? value = prefs.getBool('isLoggedIn');
  return value ?? false;
}

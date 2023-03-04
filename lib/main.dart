import 'package:flutter/material.dart';
import 'package:ticket_shop/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_shop/screens/starting_screen.dart';
import 'package:ticket_shop/utils/constants.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  String token = prefs.get(Constant.TOKEN_PREF_KEY).toString() ?? '';

  final beginPage =  token == '' ? 'STARTING' : 'HOME';

  runApp(MyApp(firstPage: beginPage));
}

class MyApp extends StatelessWidget {
  final String firstPage;
  const MyApp({Key? key, required this.firstPage}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: firstPage == 'STARTING' ? const StartingScreen() : const HomeScreen(),
      debugShowCheckedModeBanner: false
    );
  }
}
import 'package:flutter/material.dart';
import 'package:ticket_shop/screens/inscription1_screen.dart';
import 'package:ticket_shop/screens/login_screen.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Participez à tous vos évènements en prenant des Pass authentiques en toute sécurité",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff264653),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 13),
                  )
              ),
              SizedBox(height: 70),
              Image.asset(
                "assets/image/Logo_TicketShop.png",
                height: 260.0,
                width: 260.0,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 130),
                  Text("Ticket",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff264653),
                          fontFamily: "Abeganshi",
                          fontWeight: FontWeight.w500,
                          fontSize: 40)),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 170),
                  Text("Shop",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff264653),
                          fontFamily: "Abeganshi",
                          fontWeight: FontWeight.w500,
                          fontSize: 40)),
                ],
              ),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Inscription1Screen()));
                    },
                    child: Text("S'inscrire",
                        style: TextStyle(
                            color: Color(0xfff4A261),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: 15)),
                  ),
                  SizedBox(width: 100),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Text("Se Connecter",
                        style: TextStyle(
                            color: Color(0xfff4A261),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: 15)),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
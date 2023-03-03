import 'package:flutter/material.dart';
import 'package:ticket_shop/utils/theme_utils.dart';
import 'package:ticket_shop/screens/inscription2_screen.dart';

class Inscription1Screen extends StatefulWidget {
  const Inscription1Screen({Key? key}) : super(key: key);

  @override
  State<Inscription1Screen> createState() => _Inscription1ScreenState();
}

class _Inscription1ScreenState extends State<Inscription1Screen> {
  final _formKey = GlobalKey<FormState>();
  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Image.asset(
                "assets/image/Logo_TicketShop.png",
                height: 120.0,
                width: 120.0,
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(width: 160),
                  Text("Ticket",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff264653),
                          fontFamily: "Abeganshi",
                          fontWeight: FontWeight.w500,
                          fontSize: 20)),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 180),
                  Text("Shop",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff264653),
                          fontFamily: "Abeganshi",
                          fontWeight: FontWeight.w500,
                          fontSize: 20)),
                ],
              ),
              SizedBox(height: 60),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nomController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Veuillez Renseigner ce champ ";
                            }
                          },
                          decoration: InputDecoration(
                              labelText: "Nom:",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: mainColor())),
                              labelStyle: TextStyle(
                                fontFamily: "Poppins",
                                color: Color(0xff264653),
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              )),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          controller: prenomController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Veuillez Renseigner ce champ ";
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Prenom:",
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: mainColor())),
                                labelStyle: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Color(0xff264653),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ))),
                        SizedBox(height: 30),
                        TextFormField(
                          controller: emailController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Veuillez Renseigner ce champ ";
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "E-mail:",
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: mainColor())),
                                labelStyle: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Color(0xff264653),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ))),
                        SizedBox(height: 80),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xff264653)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Inscription2Screen(nom: nomController.text, prenom: prenomController.text, email: emailController.text)));
                            }
                          },
                          child: Text("SUIVANT",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              )),
                        )
                      ],
                    )),
              ),
            ]),
      ),
    ));
  }
}

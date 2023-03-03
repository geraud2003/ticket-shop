import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_shop/data/models/AuthenticatedUser.dart';
import 'package:ticket_shop/data/services/users_service.dart';
import 'package:ticket_shop/screens/home_screen.dart';
import 'package:ticket_shop/screens/login_screen.dart';
import 'package:ticket_shop/utils/constants.dart';
import 'package:ticket_shop/utils/theme_utils.dart';

class Inscription2Screen extends StatefulWidget {
  const Inscription2Screen({Key? key, required this.nom, required this.prenom, required this.email}) : super(key: key);
  final String nom, prenom, email;

  @override
  State<Inscription2Screen> createState() => _Inscription2ScreenState();
}

class _Inscription2ScreenState extends State<Inscription2Screen> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final password1Controller = TextEditingController();
  final password2Controller = TextEditingController();

  bool isLoading = false;
  _register(String nom, String prenom, String username, String email, String password) async {
    setState(() {
      isLoading = true;
    });
    try {
      var result = await UserService.create({
        'nom': nom,
        'prenom': prenom,
        'username':username,
        'email':email,
        'password': password
      });

      AuthenticatedUser authenticatedUser = await UserService.authentication({
        'email': email,
        'password': password
      });
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(Constant.USERNAME_PREF_KEY, authenticatedUser.user!.username!);
      prefs.setString(Constant.EMAIL_PREF_KEY, authenticatedUser.user!.email!);
      prefs.setString(Constant.USER_ID_PREF_KEY, authenticatedUser.user!.id!);
      prefs.setString(Constant.ORGANISATEUR_ID_PREF_KEY, '');
      prefs.setString(Constant.TOKEN_PREF_KEY, authenticatedUser.accessToken!);

      Fluttertoast.showToast(msg: "Utilisateur créé avec succès");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } on DioError catch (e) {
      Map<String, dynamic> error = e.response?.data;
      if (error != null && error.containsKey('message')) {
        Fluttertoast.showToast(msg: error['message']);
      } else {
        Fluttertoast.showToast(msg: "Une erreur est survenue veuillez rééssayer");
      }
      if (kDebugMode) {
        print(e.response);
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }


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
                              controller: usernameController,
                              validator: (String? value) {
                                if(value!.isEmpty){
                                  return "Veuillez Renseigner ce champ ";

                                }
                              },
                              decoration: InputDecoration(
                                  labelText: "Nom Utilisateur:",
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: mainColor())),
                                  labelStyle: TextStyle(
                                    fontFamily: "Poppins",
                                    color: Color(0xff264653),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  )),
                            ),
                            SizedBox(height: 30),
                            TextFormField(
                              controller: password1Controller,
                                validator: (String? value) {
                                  if(value!.isEmpty){
                                    return "Veuillez Renseigner ce champ ";

                                  }
                                },
                                decoration: InputDecoration(
                                    labelText: "Mot de Passe:",
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: mainColor())),
                                    labelStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      color: Color(0xff264653),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ))),
                            SizedBox(height: 30),
                            TextFormField(
                              controller: password2Controller,
                                validator: (String? value) {
                                  if(value!.isEmpty){
                                    if (value != password1Controller.text) {
                                      return "Ce mot de passe n'est pas identique au premier";
                                    }
                                    return "Veuillez Renseigner ce champ ";
                                  }
                                },
                                decoration: InputDecoration(
                                    labelText: "Confirmer Mot de Passe:",
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: mainColor())),
                                    labelStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      color: Color(0xff264653),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ))),
                            SizedBox(height: 80),

                            Row(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(primary: Color(0xff264653)),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("PRECEDENT", style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,fontSize: 18,
                                  )),
                                ),
                                SizedBox(width: 30),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(primary: Color(0xff264653)),
                                  onPressed: () async {
                                    if (!isLoading && _formKey.currentState!.validate()) {
                                      await _register(
                                        widget.nom,
                                        widget.prenom,
                                        usernameController.text,
                                        widget.email,
                                        password1Controller.text
                                      );
                                    }
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (context) =>LoginScreen()));
                                  },
                                  child: isLoading ?
                                  SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3,)):
                                  Text("VALIDER", style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,fontSize: 18,
                                  )),
                                ),
                              ],
                            )],
                        )),),


                ]),
          ),)
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sharedpreference/sharedpreference.dart';
import 'package:ticket_shop/data/models/AuthenticatedUser.dart';
import 'package:ticket_shop/data/services/users_service.dart';
import 'package:ticket_shop/screens/home_screen.dart';
import 'package:ticket_shop/utils/constants.dart';
import 'package:ticket_shop/utils/theme_utils.dart';
import 'package:ticket_shop/screens/inscription1_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  _login(String email, String password) async {
    setState(() {
      isLoading = true;
    });
    try {
      AuthenticatedUser authenticatedUser = await UserService.authentication(
          {'email': email, 'password': password});

      var organisateur =
          await UserService.getOrganisateur(authenticatedUser.user!.id!);

      final prefs = await SharedPreference.instance;
      prefs.set(
          Constant.USERNAME_PREF_KEY, authenticatedUser.user!.username!);
      prefs.set(Constant.EMAIL_PREF_KEY, authenticatedUser.user!.email!);
      prefs.set(Constant.USER_ID_PREF_KEY, authenticatedUser.user!.id!);
      prefs.set(Constant.ORGANISATEUR_ID_PREF_KEY,
          '${organisateur == null ? '' : organisateur.id}');
      prefs.set(Constant.TOKEN_PREF_KEY, authenticatedUser.accessToken!);

      Fluttertoast.showToast(msg: "Connexion effectuée avec succès");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } on DioError catch (e) {
      Map<String, dynamic> error = e.response?.data;
      if (error != null && error.containsKey('message')) {
        Fluttertoast.showToast(msg: error['message']);
      } else {
        Fluttertoast.showToast(
            msg: "Une erreur est survenue veuillez rééssayer");
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
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Veuillez Renseigner ce champ ";
                            }
                          },
                          decoration: InputDecoration(
                              labelText: "Email: ",
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
                            controller: passwordController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Veuillez Renseigner ce champ ";
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Mot de Passe:",
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
                          onPressed: () async {
                            if (!isLoading &&
                                _formKey.currentState!.validate()) {
                              await _login(emailController.text,
                                  passwordController.text);
                            }
                          },
                          child: isLoading
                              ? SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 3,
                                  ))
                              : Text("CONNEXION",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  )),
                        ),
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Inscription1Screen()));
                          },
                          child: Text("S'inscrire",
                              style: TextStyle(
                                  color: mainColor(),
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15)),
                        ),
                      ],
                    )),
              ),
            ]),
      ),
    ));
  }
}

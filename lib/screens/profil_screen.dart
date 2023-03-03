import 'package:flutter/material.dart';
import 'package:ticket_shop/components/app_bar.dart';
import 'package:ticket_shop/components/drawer.dart';
import 'package:ticket_shop/utils/theme_utils.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();

}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  showModified(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/image/Logo_TicketShop.png",
                    height: 70.0,
                    width: 70.0,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 100),
                      Text("Ticket",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff264653),
                              fontFamily: "Abeganshi",
                              fontWeight: FontWeight.w500,
                              fontSize: 17)),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 120),
                      Text("Shop",
                          //textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff264653),
                              fontFamily: "Abeganshi",
                              fontWeight: FontWeight.w500,
                              fontSize: 17)),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                      validator: (String? value) {
                        if(value!.isEmpty){
                          return "Veuillez Renseigner ce champ ";

                        }
                      },
                      decoration: InputDecoration(
                          labelText: "Entrez Nouveau:",
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: mainColor())),
                          labelStyle: TextStyle(
                            fontFamily: "Poppins",
                            color: Color(0xff264653),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ))),
                  SizedBox(height: 50.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: 70.0),
                      ElevatedButton(
                        child: Text("VALIDER", style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        )),
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff264653)),
                        ),
                        onPressed: () {
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBackAppBar(context, ''),
      endDrawer: buildAdministratorDrawer(context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Icon(
                  Icons.person,
                  color: Color(0xfff4A261),
                  size: 250,
                ),
              ),
              //Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Nom",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: Color(0xff264653),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Tom",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: Color(0xff264653),
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          showModified(context);
                        },
                        child: Text("Modifier",
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
              SizedBox(height: 10,),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Prenoms",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: Color(0xff264653),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Tom",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: Color(0xff264653),
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          showModified(context);
                        },
                        child: Text("Modifier",
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
              SizedBox(height: 10,),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "E-mail",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: Color(0xff264653),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Tom",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: Color(0xff264653),
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          showModified(context);
                        },
                        child: Text("Modifier",
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
              SizedBox(height: 10,),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Mot de Passe:",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: Color(0xff264653),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Tom",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: Color(0xff264653),
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          showModified(context);
                        },
                        child: Text("Modifier",
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
            ],
          ),
        ),
      ),
    );
  }
}

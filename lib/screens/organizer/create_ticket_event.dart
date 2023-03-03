import 'package:flutter/material.dart';
import 'package:ticket_shop/components/app_bar.dart';
import 'package:ticket_shop/components/drawer.dart';
import 'package:ticket_shop/screens/organizer/org_events_screen.dart';

class CreateBilletScreen extends StatefulWidget {
  const CreateBilletScreen({Key? key}) : super(key: key);

  @override
  State<CreateBilletScreen> createState() => _CreateBilletScreenState();
}

class _CreateBilletScreenState extends State<CreateBilletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBackAppBar(context, ''),
      endDrawer: buildAdministratorDrawer(context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Text(
                'TicketShop vous aide à vendre les tickets de vos événements en toute sécurité',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff264653),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Nom du Billet',
                          labelStyle: TextStyle(
                            fontFamily: "Poppins",
                            color: Color(0xff264653),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffE97954))
                          ),
                          focusedBorder:OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xfff4A261)),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez remplir le champs';
                          }
                          return null;
                        },
                      ), // nom
                      SizedBox(height: 40.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Prix du Billet',
                            labelStyle: TextStyle(
                              fontFamily: "Poppins",
                              color: Color(0xff264653),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffE97954))
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xfff4A261)),
                            )
                        ),
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez remplir le champs';
                          }
                          return null;
                        },
                      ), // date et heure
                      SizedBox(height: 40.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Privilèges du Billet',
                            labelStyle: TextStyle(
                              fontFamily: "Poppins",
                              color: Color(0xff264653),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffE97954))
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xfff4A261)),
                            )
                        ),
                        maxLines: 5,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez entrer la description';
                          }
                          return null;
                        },
                      ), // description
                      SizedBox(height: 40.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Nombre de Billet à Vendre',
                            labelStyle: TextStyle(
                              fontFamily: "Poppins",
                              color: Color(0xff264653),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffE97954))
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xfff4A261)),
                            )
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez entrer votre numéro de téléphone';
                          }
                          return null;
                        },
                      ), //contact
                      SizedBox(height: 40.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Date limite d\'Achat",
                            labelStyle: TextStyle(
                              fontFamily: "Poppins",
                              color: Color(0xff264653),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffE97954))
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xfff4A261)),
                            )
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez entrer votre numéro de téléphone';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20,),
                      Divider(),
                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                            activeColor: Colors.orange,
                          ),
                          Text(
                            "Changement du Prix du Ticket",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: Color(0xff264653),
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Prix du Ticket au changement',
                            labelStyle: TextStyle(
                              fontFamily: "Poppins",
                              color: Color(0xff264653),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffE97954))
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xfff4A261)),
                            )
                        ),
                        keyboardType: TextInputType.numberWithOptions(signed: true),
                        onChanged: (String value) {

                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez remplir le champ';
                          }
                          return null;
                        },
                      ), // Nombre de ticket
                      SizedBox(height: 40.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Date limite de Changement",
                            labelStyle: TextStyle(
                              fontFamily: "Poppins",
                              color: Color(0xff264653),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffE97954))
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xfff4A261)),
                            )
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez entrer votre numéro de téléphone';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 40,),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) =>OrgEventsScreen()));
                        },
                        child: Text('SUIVANT',style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: 15)),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff264653),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

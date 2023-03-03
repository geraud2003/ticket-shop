import 'package:flutter/material.dart';
import 'package:ticket_shop/components/app_bar.dart';
import 'package:ticket_shop/components/drawer.dart';
import 'package:ticket_shop/utils/theme_utils.dart';

class ChangeRoleScreen extends StatefulWidget {
  const ChangeRoleScreen({Key? key}) : super(key: key);

  @override
  State<ChangeRoleScreen> createState() => _ChangeRoleScreenState();
}

class _ChangeRoleScreenState extends State<ChangeRoleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBackAppBar(context, ''),
      endDrawer: buildAdministratorDrawer(context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Image.asset(
                "assets/image/Logo_TicketShop.png",
                height: 70.0,
                width: 70.0,
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
                          fontSize: 15)),
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
                          fontSize: 15)),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Veuillez renseigner toutes les informations pour la validation de votre statut d\'organisateur',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff264653),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Numéro de téléphone',
                        labelStyle: TextStyle(
                          fontFamily: "Poppins",
                          color: Color(0xff264653),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                            prefixIcon: Icon(Icons.phone),
                           enabledBorder: OutlineInputBorder(
                               borderSide: BorderSide(color: Color(0xffE97954))
                           ),
                            focusedBorder:OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xfff4A261)),
                          ),),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Veuillez entrer votre numéro de téléphone';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 40.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Votre expérience',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffE97954))
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xfff4A261)),
                            ),
                              labelStyle: TextStyle(
                                fontFamily: "Poppins",
                                color: Color(0xff264653),
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),),
                          maxLines: 5,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Veuillez entrer votre expérience';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 40.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Informations sur votre structure',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffE97954))
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xfff4A261)),
                            ),
                              labelStyle: TextStyle(
                                fontFamily: "Poppins",
                                color: Color(0xff264653),
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffE97954))
                            ),
                          ),
                          maxLines: 5,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Veuillez entrer des informations sur votre structure';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 40.0),
                        ElevatedButton(
                          onPressed: () {
                            // Action à effectuer lors du clic sur le bouton d'envoi de fichier
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffE97954),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.upload),
                              SizedBox(width: 10),
                              Text('Télécharger fichier/pieces'),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            // Action à effectuer lors du clic sur le bouton de validation
                          },
                          child: Text('VALIDER',style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: 15)),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff264653),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
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

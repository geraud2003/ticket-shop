import 'package:flutter/material.dart';
import 'package:ticket_shop/components/app_bar.dart';
import 'package:ticket_shop/components/drawer.dart';
import 'package:ticket_shop/screens/organizer/create_ticket_event.dart';
import 'package:ticket_shop/utils/theme_utils.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({Key? key}) : super(key: key);

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  String _selectedCategory = "Party";
  List<String> _categories = ['Party', 'Films', "Concerts"];

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
                          labelText: 'Nom de l\'événement',
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
                            labelText: 'Date et heure',
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
                      SizedBox(height: 20.0),
                      DropdownButtonFormField(
                          value: _selectedCategory,
                          items: _categories.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              _selectedCategory = val as String;
                            });
                          }),
                      SizedBox(height: 40.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Description',
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
                          labelText: 'Contact',
                          prefixIcon: Icon(Icons.phone),
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
                      SizedBox(height: 20.0),
                      Divider(),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Nombre de tickets',
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
                            return 'Veuillez remplir le champs';
                          }
                          return null;
                        },
                      ), // Nombre de ticket
                      SizedBox(height: 40.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => CreateBilletScreen()));
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

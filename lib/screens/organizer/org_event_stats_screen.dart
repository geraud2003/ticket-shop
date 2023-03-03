import 'package:flutter/material.dart';
import 'package:ticket_shop/components/app_bar.dart';
import 'package:ticket_shop/components/drawer.dart';
import 'package:ticket_shop/data/models/evenement.dart';

class OrgEventStatScreen extends StatelessWidget {
  final Evenement evenement;
  const OrgEventStatScreen({Key? key, required this.evenement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBackAppBar(context, ''),
      endDrawer: buildAdministratorDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
                margin: const EdgeInsets.symmetric(vertical: 50),
                //width: double.infinity,
                decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/images/party.jpeg'),
          fit: BoxFit.cover
      ),),),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text('Nom de l\'evenement',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff264653),
                      fontFamily: "Abeganshi",
                      fontWeight: FontWeight.w500,
                      fontSize: 30)),
            ),
            const SizedBox(height: 30,),
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Billets Vendus',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff264653),
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700,
                          fontSize: 40)
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text(
                    '9999',
                      style: TextStyle(
                          color: Color(0xfff4A261),
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w800,
                          fontSize: 55)
                  ),
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xfff4A261), width: 2.0,)),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  children: List.generate(
                      3,
                      (index) => Column(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('Pass VIP'),
                              Text('Nombre',
                                  style: TextStyle(color: Colors.amber))
                            ],
                          )),
                ),
              ),
            ),
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Somme récoltées',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff264653),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                        fontSize: 40),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '9999',
                      style: TextStyle(
                          color: Color(0xfff4A261),
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w800,
                          fontSize: 55)
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

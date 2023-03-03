import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_shop/components/app_bar.dart';
import 'package:ticket_shop/components/drawer.dart';
import 'package:ticket_shop/components/tscard.dart';
import 'package:ticket_shop/data/models/evenement.dart';
import 'package:ticket_shop/data/services/evenements_service.dart';
import 'package:ticket_shop/data/services/organisateurs_service.dart';
import 'package:ticket_shop/screens/organizer/org_event_stats_screen.dart';
import 'package:ticket_shop/utils/constants.dart';

class OrgEventsScreen extends StatefulWidget {
  const OrgEventsScreen({super.key});

  @override
  State<OrgEventsScreen> createState() => _OrgEventsScreenState();
}

class _OrgEventsScreenState extends State<OrgEventsScreen> {
  List<Evenement> evenements = [];
  bool isLoading = false;

  _load() async {
    setState(() {
      isLoading = true;
    });
    try {
      final prefs = await SharedPreferences.getInstance();
      String organisateur_id = prefs.getString("Constant.ORGANISATEUR_ID_PREF_KEY")!;
      evenements = await OrganisateurService.getEvenements(organisateur_id);
    } on DioError catch (e) {
      print(e);
      Map<String, dynamic> error = e.response?.data;
      if (error != null && error.containsKey('message')) {
        Fluttertoast.showToast(msg: error['message']);
      } else {
        Fluttertoast.showToast(
            msg: "Une erreur est survenue veuillez rééssayer");
      }
    } finally {
      isLoading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildBackAppBar(context, ''),
        endDrawer: buildAdministratorDrawer(context),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Text("Evenements",
                            style: TextStyle(
                                color: Color(0xff264653),
                                fontFamily: "Abeganshi",
                                fontWeight: FontWeight.w600,
                                fontSize: 40)),
                      ],
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Organises",
                            style: TextStyle(
                                color: Color(0xff264653),
                                fontFamily: "Abeganshi",
                                fontWeight: FontWeight.w600,
                                fontSize: 40)),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  )
                ] +
                List.generate(evenements.length, (int index) {
                  return buildTSCard(evenements[index].titre!, AssetImage('assets/image/party.jpeg'),
                      () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrgEventStatScreen(evenement: evenements[index])));
                  });
                }

                    /*Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.network(
                      'https://placeimg.com/640/480/any',
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                  ) ?? Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/wakfu.png'),
                                    fit: BoxFit.cover
                                ),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey)]
                            ),
                          ),
                          Center(
                            child: Text(
                                'Nom événement',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Abeganshi',
                                    color: Colors.white
                                )
                            ),
                          )
                        ],
                      )
                  )*/

                    ),
          ),
        ));
  }
}

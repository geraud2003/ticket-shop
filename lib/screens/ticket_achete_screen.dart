import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_shop/components/app_bar.dart';
import 'package:ticket_shop/components/tscard.dart';
import 'package:ticket_shop/data/models/achat.dart';
import 'package:ticket_shop/data/models/ticket.dart';
import 'package:ticket_shop/data/services/tickets_service.dart';
import 'package:ticket_shop/data/services/users_service.dart';
import 'package:ticket_shop/screens/TicketOnlyScreen.dart';
import 'package:ticket_shop/utils/constants.dart';
import 'package:ticket_shop/utils/theme_utils.dart';
import 'home_screen.dart';

class TicketsAcheteScreen extends StatefulWidget {
  const TicketsAcheteScreen({Key? key}) : super(key: key);

  @override
  State<TicketsAcheteScreen> createState() => _TicketsAcheteScreenState();
}

class _TicketsAcheteScreenState extends State<TicketsAcheteScreen> {
  List<Achat?> achats = [];
  List<Ticket?> ticketsAchete = [];
  bool isLoading = false;

  loadAchat() async {
    setState(() {
      isLoading = true;
    });
    try {
      final prefs = await SharedPreferences.getInstance();
      String user_id = prefs.getString(Constant.USER_ID_PREF_KEY)!;
      achats = await UserService.getAchats(user_id);
      for(int i = 0; i < achats.length; i++) {
        ticketsAchete.add(await TicketService.get(achats[i]!.ticketId!));
      }
    } on DioError catch (e) {
      Map<String, dynamic> error = e.response?.data;
      if (error != null && error.containsKey('message')) {
        Fluttertoast.showToast(msg: error['message']);
      } else {
        Fluttertoast.showToast(
            msg: "Une erreur est survenue veuillez rééssayer");
      }
      print(e.response);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadAchat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBackAppBar(context, ""),
      body: SingleChildScrollView(
        child: isLoading
            ? Center(
                child: SizedBox(
                    height: 20, width: 20, child: CircularProgressIndicator()))
            : achats.length == 0
                ? Center(
                    child: Text(
                      "Aucuns achats éffectué",
                      style: TextStyle(
                          fontSize: 20.0, fontStyle: FontStyle.italic),
                    ),
                  )
                : Center(
                    child: Column(
                      children: [
                        Expanded(
                            child: Column(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              child: const Text(
                                'Tickets achetes',
                                style: TextStyle(fontSize: 40),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                    achats.length,
                                    (index) => buildTSCard(
                                        "${ticketsAchete[index]!.nom!} ${ticketsAchete[index]!.prix!}",
                                        AssetImage('assets/images/party.jpeg'),
                                        () {})),
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
      ),
    );
  }
}

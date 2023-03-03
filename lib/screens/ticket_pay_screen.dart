import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ticket_shop/components/app_bar.dart';
import 'package:ticket_shop/components/drawer.dart';
import 'package:ticket_shop/data/models/evenement.dart';
import 'package:ticket_shop/data/models/ticket.dart';
import 'package:ticket_shop/data/services/evenements_service.dart';
import 'package:ticket_shop/screens/ticket_achete_screen.dart';

class TicketPayScreen extends StatefulWidget {
  final Evenement evenement;
  const TicketPayScreen({Key? key, required this.evenement}) : super(key: key);

  @override
  State<TicketPayScreen> createState() => _TicketPayScreenState();
}

class _TicketPayScreenState extends State<TicketPayScreen> {
  List<Ticket> tickets = [];
  bool isLoadingTickets = false;

  showPaymentDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(20.0),
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
                    children: const [
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
                    children: const [
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
                  const SizedBox(height: 10.0),
                  const Text(
                    'Moyen de paiement',
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: Color(0xfff4A261),
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                        activeColor: Colors.orange,
                      ),
                      const Text(
                        "Mobile Money",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: Color(0xff264653),
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                        activeColor: Colors.orange,
                      ),
                      const Text(
                        "Virement Bancaire",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: Color(0xff264653),
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xff264653)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Annuler",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            )),
                      ),
                      const SizedBox(width: 80.0),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xff264653)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          showMobileMoneyDialog(context);
                        },
                        child: const Text("Suivant",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  showMobileMoneyDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(20.0),
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
                    children: const [
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
                    children: const [
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
                  const SizedBox(height: 20.0),
                  const Text(
                    "Paiement: ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: Color(0xfff4A261),
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Mobile Money',
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: Color(0xff264653),
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Numéro de téléphone',
                      labelStyle: TextStyle(
                        fontFamily: "Poppins",
                        color: Color(0xff264653),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer un numéro de téléphone';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 50.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xff264653)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Annuler",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            )),
                      ),
                      const SizedBox(width: 70.0),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xff264653)),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const TicketsAcheteScreen(),
                            ),
                          );
                        },
                        child: const Text("Suivant",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  showTotalTicketDialog(BuildContext context) {
    final ticketNames = tickets.map((e) => e.nom).toList();
    String? selected = ticketNames == null ? "" : ticketNames[0];

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(20.0),
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
                    children: const [
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
                    children: const [
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
                  const SizedBox(height: 10.0),
                  /*TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Type de Ticket',
                      labelStyle: TextStyle(
                        fontFamily: "Poppins",
                        color: Color(0xff264653),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffE97954))),
                      focusedBorder: OutlineInputBorder(
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
                  ),
                  */
                  const SizedBox(height: 30.0),
                  DropdownButtonFormField(
                      value: selected,
                      items: ticketNames.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e!),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          selected = val as String;
                        });
                      }),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Prix du Ticket',
                        labelStyle: TextStyle(
                          fontFamily: "Poppins",
                          color: Color(0xff264653),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffE97954))),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff4A261)),
                        )),
                    keyboardType:
                    const TextInputType.numberWithOptions(signed: true),
                    onChanged: (String value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez remplir le champ';
                      }
                      return null;
                    },
                  ), // Nombre de ticket
                  const SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xff264653)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Annuler",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            )),
                      ),
                      const SizedBox(width: 80.0),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xff264653)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          showPaymentDialog(context);
                        },
                        child: const Text("Suivant",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  loadTickets() async {
    setState(() {
      isLoadingTickets = true;
    });
    try {
      tickets = await EvenementService.getTickets(widget.evenement.id!);
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
      isLoadingTickets = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    loadTickets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBackAppBar(context, ''),
      endDrawer: buildUserDrawer(context),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: const Color(0xff264653)),
        onPressed: () {
          showTotalTicketDialog(context);
        },
        child: const Text("PARTICIPER",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              fontSize: 18,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                  Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: double.infinity,
                      child: Image.asset("assets/image/party.jpeg",
                          height: 250, width: 100, fit: BoxFit.cover)),
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber, width: 1.0),
                        //backgroundBlendMode: BlendMode.softLight,
                      ),
                      child: Center(
                        child: Text(widget.evenement.titre!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Color(0xff264653),
                                fontFamily: "Abeganshi",
                                fontWeight: FontWeight.w500,
                                fontSize: 30)),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        const Text('Description:',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontFamily: "Poppins",
                              color: Color(0xff264653),
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.evenement.description!,
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            color: Color(0xff264653),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ] +
                List.generate(
                    tickets.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Card(
                            child: ListTile(
                              leading: Text('${tickets[index].prix!}'),
                                title: Text(tickets[index].nom!),
                              subtitle: Text(tickets[index].description!),

                            ),
                          ),
                    ))),
      ),
    );
  }
}

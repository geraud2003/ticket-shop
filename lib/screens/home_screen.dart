import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ticket_shop/components/app_bar.dart';
import 'package:ticket_shop/components/drawer.dart';
import 'package:ticket_shop/components/tscard.dart';
import 'package:ticket_shop/data/models/categorie.dart';
import 'package:ticket_shop/data/models/evenement.dart';
import 'package:ticket_shop/data/services/categories_service.dart';
import 'package:ticket_shop/data/services/evenements_service.dart';
import 'package:ticket_shop/screens/ticket_pay_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Evenement> evenements = [];
  List<Categorie> categories = [];
  bool isLoading = false;

  _load() async {
    setState(() {
      isLoading = true;
    });
    try {
      evenements = await EvenementService.fetch();
      categories = await CategorieService.fetch();
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
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: buildAppBarLogo1(),
          backgroundColor: Color(0xffE97954),
          bottom: TabBar(indicatorColor: Colors.white, tabs: [
            Tab(
              icon: null,
              child: Text(
                "Party",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w200,
                    fontSize: 15),
              ),
            ),
            Tab(
              icon: null,
              child: Text(
                "Concerts",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w200,
                    fontSize: 15),
              ),
            ),
            Tab(
              icon: null,
              child: Text(
                "Films",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w200,
                    fontSize: 15),
              ),
            )
          ]),
        ),
        endDrawer: buildDrawer(context),
        body: isLoading
            ? Center(
                child: SizedBox(
                    height: 20, width: 20, child: CircularProgressIndicator()))
            : TabBarView(physics: const BouncingScrollPhysics(), children: [
                Page(
                    text: "Party",
                    evenements: evenements
                        .where((element) => element.categorie_id == 1)
                        .toList()),
                Page(
                    text: "Statut",
                    evenements: evenements
                        .where((element) => element.categorie_id == 2)
                        .toList()),
                Page(
                    text: "Appels",
                    evenements: evenements
                        .where((element) => element.categorie_id == 3)
                        .toList())
              ]),
      ),
    ));
  }
}

class Page extends StatelessWidget {
  final String text;
  final List<Evenement> evenements;

  const Page({Key? key, required this.text, required this.evenements})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return evenements.length > 0
        ? ListView.builder(
            itemCount: evenements.length,
            itemBuilder: (BuildContext context, int index) {
              return buildTSCard(
                  evenements[index].titre!, AssetImage('assets/images/party.jpeg'),
                  () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TicketPayScreen(evenement: evenements[index])));
              });
            },
          )
        : Center(
            child: Text(
              "Aucuns evenement",
              style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
            ),
          );
  }
}

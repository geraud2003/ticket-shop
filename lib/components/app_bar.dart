import 'package:flutter/material.dart';

Widget buildAppBarLogo() {
  return Row(children: [
    //SizedBox(width: 10,),
    Image.asset("assets/image/Logo_TicketShop.png", height: 50, width: 50),
    Column(
      children: [
        SizedBox(height: 15,),
        Row(
          children: [
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
            SizedBox(width: 20),
            Text("Shop",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff264653),
                    fontFamily: "Abeganshi",
                    fontWeight: FontWeight.w500,
                    fontSize: 15)),
          ],
        ),
      ],
    ),
  ]
  );
}
Widget buildAppBarLogo1() {
  return Row(children: [
    SizedBox(width: 10,),
    Image.asset("assets/image/Logo_TicketShop.png", height: 70, width: 70),
    Column(
      children: [
        SizedBox(height: 15,),
        Row(
          children: [
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
            SizedBox(width: 20),
            Text("Shop",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff264653),
                    fontFamily: "Abeganshi",
                    fontWeight: FontWeight.w500,
                    fontSize: 20)),
          ],
        ),
      ],
    ),
  ]
  );
}

AppBar buildMainAppBar([String title = '']) {
  return AppBar(
    title: Text(title),
    leading: buildAppBarLogo(),
    backgroundColor: Color(0xffE97954),
  );
}

AppBar buildBackAppBar(BuildContext context, String title) {
  return AppBar(
      title: Text(title),
      backgroundColor: Color(0xffE97954),
      leading: Row(children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        buildAppBarLogo()
      ]));
}
DefaultTabController buildMainAppBarPart([String title = '']) {
  return DefaultTabController(length: 3, child: Scaffold(appBar: AppBar(
    title: Text(title),
    leading: buildAppBarLogo(),
    bottom: TabBar(tabs: [
      Tab(
        icon: null,
        text: "Party",
      ),
      Tab(
        icon: null,
        text: "Concerts",
      ),
      Tab(
        icon: null,
        text: "Films",
      )
    ],),
  ),
      body: TabBarView(physics: const BouncingScrollPhysics(), children: [
    Page(text:"Party"),
    Page(text: "Concerts"),
    Page(text: "Films")
  ])),
  );
}
class Page extends StatelessWidget {
  final String text;

  const Page({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}


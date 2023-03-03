import 'package:flutter/material.dart';

class AdminEventsScreen extends StatefulWidget {
  const AdminEventsScreen({Key? key}) : super(key: key);

  @override
  State<AdminEventsScreen> createState() => _AdminEventsScreenState();
}

class _AdminEventsScreenState extends State<AdminEventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Evenements Organisés", style: TextStyle(fontFamily: "Abeganshi", fontSize: 32)),
          SizedBox(height: 30,),
        ] + List.generate(4, (index) => Container (
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/party.jpeg'),
              fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey)]
          ),
          child: Text('Du texte'),
        ) ?? Card(
          elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/party.jpeg'),
                fit: BoxFit.cover
              )
            ),
            child: Text("Test"),
          ),
        )),
      ),
    );
  }
}

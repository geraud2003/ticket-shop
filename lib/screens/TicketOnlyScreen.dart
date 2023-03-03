import 'package:flutter/material.dart';
import 'package:ticket_shop/components/app_bar.dart';

class TicketOnlyScreen extends StatefulWidget {
  const TicketOnlyScreen({Key? key}) : super(key: key);

  @override
  State<TicketOnlyScreen> createState() => _TicketOnlyScreenState();
}

class _TicketOnlyScreenState extends State<TicketOnlyScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: buildBackAppBar(context, ""),
          body: Column(
            children: [
              SizedBox(height: 20,),
              Image.asset("assets/image/party.jpeg",)
            ],
          ),
    ));
  }
}

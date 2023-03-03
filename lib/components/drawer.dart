import 'package:flutter/material.dart';
import 'package:sharedpreference/sharedpreference.dart';
import 'package:ticket_shop/screens/home_screen.dart';
import 'package:ticket_shop/screens/login_screen.dart';
import 'package:ticket_shop/screens/change_role_screen.dart';
import 'package:ticket_shop/screens/organizer/create_event_screen.dart';
import 'package:ticket_shop/screens/organizer/org_events_screen.dart';
import 'package:ticket_shop/screens/profil_screen.dart';
import 'package:ticket_shop/screens/ticket_achete_screen.dart';
import 'package:ticket_shop/utils/constants.dart';

Drawer buildUserDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: Color(0xffE97954),
    child: ListView(
      //padding: EdgeInsets.zero,
      children: [
        const UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),

          ),
          accountName:Text(
              'Jane Doe',
              style: TextStyle(
                fontSize: 24.0,
                color: Color(0xffE97954),
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700,
              ),
            ),
          accountEmail: Text(
            'jane.doe@example.com',
            style: TextStyle(
              fontSize: 18.0,
              color: Color(0xffE97954),
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.house,
            color: Colors.white,
          ),
          title: const Text(
            'Home',
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 24),
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const HomeScreen(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.gif_box,
            color: Colors.white,
          ),
          title: const Text(
            'Tickets Achetés',
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 24),
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const TicketsAcheteScreen(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.straight,
            color: Colors.white,
          ),
          title: const Text(
            'Statut Organisateur',
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 24),
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const ChangeRoleScreen(),
              ),
            );
          },
        ),
        const Divider(
          height: 10,
          thickness: 1,
        ),
        ListTile(
          leading: const Icon(Icons.person, color: Colors.white),
          title: const Text(
            'Profil',
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 24),
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const ProfilScreen(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.output_outlined,
            color: Colors.white,
          ),
          title: const Text(
            'Déconnexion',
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 24),
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const LoginScreen(),
              ),
            );
          },
        ),
      ],
    ),
  );
}

Drawer buildAdministratorDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: Color(0xffE97954),
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
          ),
          accountName:Text(
            'Jane Doe',
            style: TextStyle(
              fontSize: 24.0,
              color: Color(0xffE97954),
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
            ),
          ),
          accountEmail: Text(
            'jane.doe@example.com',
            style: TextStyle(
              fontSize: 18.0,
              color: Color(0xffE97954),
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.house,
            color: Colors.white,
          ),
          title: const Text(
            'Home',
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 24),
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const HomeScreen(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.gif_box,
            color: Colors.white,
          ),
          title: const Text(
            'Tickets Achetés',
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 24),
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const TicketsAcheteScreen(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.all_inbox,
            color: Colors.white,
          ),
          title: const Text(
            'Evènements Organisés',
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 24),
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const OrgEventsScreen(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.event,
            color: Colors.white,
          ),
          title: const Text(
            'Créer un Evènement',
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 24),
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const CreateEventScreen(),
              ),
            );
          },
        ),
        const Divider(
          height: 10,
          thickness: 1,
        ),
        ListTile(
          leading: const Icon(Icons.person, color: Colors.white),
          title: const Text(
            'Profil',
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 24),
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const ProfilScreen(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.output_outlined,
            color: Colors.white,
          ),
          title: const Text(
            'Déconnexion',
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 24),
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const LoginScreen(),
              ),
            );
          },
        ),
      ],
    ),
  );
}

Drawer buildDrawer(context) {
  final prefs = SharedPreference.instance;
  if (prefs.get(Constant.ORGANISATEUR_ID_PREF_KEY).empty()) {
    return buildUserDrawer(context);
  } else {
    return buildAdministratorDrawer(context);
  }
}

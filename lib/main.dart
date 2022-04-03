// import 'package:eventify/create_event.dart';
// import 'package:eventify/dashboard/admin_dashboard.dart';
// import 'package:eventify/dashboard/attendee_dashboard.dart';
import 'package:eventify/dashboard/organizer_dashboard.dart';
// import 'package:eventify/homepage.dart';
// import 'package:eventify/dashboard/organizer_dashboard.dart';
// import 'package:eventify/homepage.dart';
// import 'package:eventify/dashboard/organizer_dashboard.dart';
// import 'package:eventify/homepage.dart';
import 'package:eventify/models/User.dart';
// import 'package:eventify/dashboard/organizer_dashboard.dart';
// import 'package:eventify/user_management/User.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eventify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      // home: const HomePage(),
      // home: AdminDashboard(
      //     user: User(
      //   name: "AdminUser",
      //   email: "admin@user.com",
      //   birthDate: "24/11/1998",
      //   profile: "admin",
      // )),
      // home: AttendeeDashboard(
      //     user: User(
      //   name: "Vasu Gamdha",
      //   email: "vasugamdhacan@gmail.com",
      //   birthDate: "12/12/2022",
      //   profile: "atendee",
      // )),

      home: OrganizerDashboard(
        user: User(
            name: "Jay Sonani",
            email: "jsonani98@gmail.com",
            birthDate: "asd",
            profile: "Organizer"),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

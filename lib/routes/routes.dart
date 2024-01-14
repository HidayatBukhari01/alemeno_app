import 'package:alemeno_app/routes/routes_name.dart';
import 'package:alemeno_app/screens/tab.screens/bookappointment.screen/book_appointment_screen.dart';
import 'package:alemeno_app/screens/tab.screens/carttab.screen/my_cart_screen.dart';
import 'package:alemeno_app/screens/tab.screens/carttab.screen/widgets/status_screen.dart';
import 'package:alemeno_app/screens/tab.screens/hometab.screen/home_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  Map<String, Widget Function(BuildContext)> routes = {
    RouteName.cartScreenRoute: (context) => const MyCartScreen(),
    RouteName.bookAppointmentRoute: (context) => const BookAppointmentScreen(),
    RouteName.statusRoute: (context) => const StatusScreen(),
    RouteName.home: (context) => const HomeScreen(),
  };
}

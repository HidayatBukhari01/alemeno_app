import 'package:alemeno_app/routes/routes.dart';
import 'package:alemeno_app/screens/tab.screens/hometab.screen/home_screen.dart';
import 'package:alemeno_app/screens/tab.screens/hometab.screen/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HomeViewModel())],
      child: Consumer(
        builder: (context, value, child) {
          return MaterialApp(
            title: 'Alemeno App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            routes: Routes().routes,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}

import 'package:tree_bud/screens/loadpage.dart';
import 'package:tree_bud/screens/arfunction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            fontFamily: 'Montserrat-Regular',
          ),

        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoadPage(),
      routes: {
        '/ARfunction': (context) => const ARfunction(),
      }
    );
  }
}

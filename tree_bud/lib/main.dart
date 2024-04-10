import 'package:ar_function/screens/infotree.dart';
import 'package:ar_function/screens/loadpage.dart';
import 'package:ar_function/screens/arfunction.dart';
import 'package:ar_function/widgets/historyname.dart';
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
      ),
      debugShowCheckedModeBanner: false,
      home: const InfoTree(),
      routes: {
        '/ARfunction': (context) => const ARfunction(),
      }
    );
  }
}

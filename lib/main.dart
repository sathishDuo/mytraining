import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mytraining/provider/banner_provider.dart';
import 'package:mytraining/provider/concept_proivder.dart';
import 'package:mytraining/ui/home/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => BannerProvider()),
      ChangeNotifierProvider(create: (_) => ConceptProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyTrainings',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'OpenSans',
      ),
      home: MyHomePage(),
    );
  }
}

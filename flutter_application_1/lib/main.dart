// Student Names:
// San Aram
// Halan Hunar

import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Provider

import 'app/service_locator.dart';
import 'screens/main/main_screen.dart';
import 'screens/main/main_viewmodel.dart';

void main() {
  initializeServiceLocator();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainViewmodel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MAP Exercise 4',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainScreen(),
      ),
    ),
  );
}

//! This is file is meant for the first screen, i.e., ListScreen.
//! Parts of the code have been given. Complete the remaining.

import 'package:flutter/material.dart';
import '../view.dart';
import 'main_app_bar.dart';
import 'main_body.dart';
import 'main_float.dart';
import 'main_viewmodel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainViewmodel viewmodel;

  @override
  void initState() {
    super.initState();
    viewmodel = MainViewmodel();
    viewmodel.fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<MainViewmodel>(
      builder: (context, model, child) => Scaffold(
        appBar: const MainAppBar(),
        body: MainBody(),
        floatingActionButton: const MainFloat(),
      ),
    );
  }
}

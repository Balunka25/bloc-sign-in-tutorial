import 'package:bloc_tutorial/app_get_it.dart';
import 'package:bloc_tutorial/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initReactions(widgetsBinding);
  
  runApp(const AppWidget());
}

Future<void> initReactions(widgetsBinding) async {
  await AppGetIt().setup();
}

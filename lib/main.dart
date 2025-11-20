import 'package:flutter/material.dart';
import 'package:grind_lab/app.dart';
import 'package:grind_lab/core/dependency_injection/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const App());
}

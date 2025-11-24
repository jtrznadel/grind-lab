import 'package:flutter/material.dart';
import 'package:grind_lab/app.dart';
import 'package:grind_lab/core/dependency_injection/dependency_injection.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //fixme: initialize only needed locale
  await initializeDateFormatting('en_US', null);
  await configureDependencies();
  runApp(const App());
}

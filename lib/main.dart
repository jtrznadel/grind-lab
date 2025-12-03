import 'package:flutter/material.dart';
import 'package:grind_lab/app.dart';
import 'package:grind_lab/core/dependency_injection/dependency_injection.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //fixme: initialize only needed locale
  await initializeDateFormatting('en_US', null);
  await dotenv.load();
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? '',
    debug: true,
  );
  await configureDependencies();
  runApp(const App());
}

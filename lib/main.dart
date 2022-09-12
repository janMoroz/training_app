import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:training_app_hive/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  
  runApp(MyApp());
}

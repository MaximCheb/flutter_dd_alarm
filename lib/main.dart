import 'package:flutter/material.dart';

import 'app.dart';
import 'locator_service.dart' as GI;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GI.init();  
  runApp(AlarmApp());
}




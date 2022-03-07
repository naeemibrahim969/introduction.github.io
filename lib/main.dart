import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uipractice/utils/paths.dart';
import 'app/locator.dart';
import 'package:uipractice/app/router.dart' as router;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title:'UI Practice',
      initialRoute: Paths.splash,
      onGenerateRoute: router.generateRoute,
      navigatorKey: StackedService.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}

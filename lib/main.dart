import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:np_app_test/firebase_options.dart';
import 'package:np_app_test/router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        initialRoute: '/selectPage',
        navigatorKey: navigatorKey,
        onGenerateRoute: RouterScreen.generateRoute);
  }
}

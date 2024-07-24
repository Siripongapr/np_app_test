import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:np_app_test/firebase_options.dart';
import 'package:np_app_test/router.dart';
import 'package:np_app_test/test1/widget/colors.dart';

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
        theme: ThemeData(
            dialogBackgroundColor: Colors.white,
            scaffoldBackgroundColor: Colors.white,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
              backgroundColor: AppPalette.primaryGreen,
              foregroundColor: Colors.white,
            )),
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
              foregroundColor: AppPalette.primaryGreen,
            )),
            appBarTheme:
                const AppBarTheme(backgroundColor: AppPalette.primaryGreen)),
        initialRoute: '/selectPage',
        navigatorKey: navigatorKey,
        onGenerateRoute: RouterScreen.generateRoute);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/core/app/app.locator.dart';
import 'package:voting_app/core/app/app.router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:voting_app/firebase/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupLocator();
  await locator<Database>().initializeDb();
  await dotenv.load(fileName: "assets/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const MaterialColor kToDark = MaterialColor(
      0xFF4ec278, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
      <int, Color>{
        50: ColorList.lightGreen, //10%
        100: ColorList.lightGreen, //20%
        200: ColorList.lightGreen, //30%
        300: ColorList.lightGreen, //40%
        400: ColorList.primaryColor, //50%
        500: ColorList.primaryColor, //60%
        600: ColorList.primaryColor, //70%
        700: ColorList.primaryColor, //80%
        800: ColorList.darkGreen, //90%
        900: ColorList.darkGreen, //100%
      },
    );
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: kToDark,
          primaryColor: ColorList.primaryColor,
          brightness: Brightness.light,
          buttonTheme: const ButtonThemeData(
              buttonColor: ColorList.primaryColor,
              hoverColor: ColorList.darkGreen)),
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      locale: const Locale('en'),
      // home: VotingHomePage(),
    );
  }
}

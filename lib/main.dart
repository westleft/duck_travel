import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:duck_travel/route/index.dart';
import 'package:duck_travel/screens/home_screen.dart';
import 'package:duck_travel/utils/token.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await AccessToken.init();

  runApp(
    MaterialApp(
      // home: const App(),
      routes: routes,
      // theme: ThemeData(
      //   useMaterial3: true,
      //   colorScheme: ColorScheme.fromSeed(
      //     seedColor: Colors.white,
      //   ),
      // ),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}

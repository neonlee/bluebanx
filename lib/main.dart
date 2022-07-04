import 'package:bluebenx/core/constants/colors.dart';
import 'package:bluebenx/core/di/di.dart';
import 'package:bluebenx/core/routes/named_routes.dart';
import 'package:bluebenx/core/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  init();
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: CustomColors.purple),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: CustomColors.purple),
          ),
          focusColor: CustomColors.purple,
          fillColor: CustomColors.purple,
          hoverColor: CustomColors.purple,
        ),
        switchTheme: SwitchThemeData(
          trackColor: MaterialStateProperty.all(CustomColors.purple),
          thumbColor: MaterialStateProperty.all(CustomColors.white),
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(CustomColors.white),
          fillColor: MaterialStateProperty.all(CustomColors.purple),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(CustomColors.purple),
        ),
        progressIndicatorTheme:
            ProgressIndicatorThemeData(color: CustomColors.purple),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: CustomColors.purple,
            fixedSize: const Size(150, 50),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      ),
      initialRoute: NamedRoutes.loginRoute,
      routes: Routes.routes,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_car_installmemt_app/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(

  flutterCarInstallmemtApp()
  );
}




class flutterCarInstallmemtApp extends StatefulWidget {
  const flutterCarInstallmemtApp({super.key});

  @override
  State<flutterCarInstallmemtApp> createState() => _flutterCarInstallmemtAppState();
}

class _flutterCarInstallmemtAppState extends State<flutterCarInstallmemtApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
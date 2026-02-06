import 'package:flutter/material.dart';
import 'package:flutter_car_installmemt_app/views/car_installment_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CarInstallmentUi()),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 36, 249, 117),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/kkk.png',
              width: 350,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 50.0),
            Center(
              child: Text(
                'Car Installment\n คำนวณค่างวดรถยนต์',
                textAlign: TextAlign.center,
                style: TextStyle(

                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),


            SizedBox(height: 60.0),
            CircularProgressIndicator(color: Colors.white),
              SizedBox(
                height: 80.0,
              ),
            Center(
              child: Text(
                'Created by NinniN DTI-SAU\nVersion 1.0.0',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
              
          ],),
            )
    );
            

  }
}

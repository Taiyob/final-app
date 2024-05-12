//import 'package:e_commerce_app/presentation/screens/email_verification_screen.dart';
import 'package:e_commerce_app/presentation/screens/home_screen.dart';
import 'package:e_commerce_app/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }

  void _moveToNextScreen() async{
    await Future.delayed(const Duration(seconds: 2,),);
    Get.off(()=> const HomeScreen(),);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            AppLogo(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 16,),
            Text('1.0.0'),
            SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}



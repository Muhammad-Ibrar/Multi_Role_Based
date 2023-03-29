
import 'dart:async' show Timer;
import 'package:flutter/material.dart';
import 'package:multi_role_base/home_screen.dart';
import 'package:multi_role_base/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await  SharedPreferences.getInstance();

    bool isLogin = sp.getBool('isLogin') ?? false;

    if(isLogin){
      Timer(Duration(seconds: 3) , () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    }
    else {
      Timer(Duration(seconds: 3) , () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fitHeight,
        image: NetworkImage('https://images.pexels.com/photos/1382731/pexels-photo-1382731.jpeg?auto=compress&cs=tinysrgb&w=600'),
      ),
    );
  }
}

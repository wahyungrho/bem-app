import 'dart:async';

import 'package:app_bem/main_page.dart';
import 'package:app_bem/models/models.dart';
import 'package:app_bem/pages/pages.dart';
import 'package:app_bem/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthServices>(create: (_) => AuthServices()),
        ChangeNotifierProvider<StaffServices>(create: (_) => StaffServices()),
        ChangeNotifierProvider<UserServices>(create: (_) => UserServices()),
        ChangeNotifierProvider<MeetingServices>(
            create: (_) => MeetingServices()),
        ChangeNotifierProvider<EventServices>(create: (_) => EventServices()),
        ChangeNotifierProvider<ProposalServices>(
            create: (_) => ProposalServices()),
        ChangeNotifierProvider<LPJServices>(create: (_) => LPJServices()),
      ],
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool? isLogin = false;

  Future<bool?> getPreference() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      isLogin = sharedPreferences.getBool(UserPrefProfile.isLogin);

      return isLogin;
    } catch (e) {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 3000), () async {
      bool? isLogin = await getPreference();
      if (isLogin == true) {
        Get.off(const MainPage());
      } else {
        Get.off(const LoginPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Center(
            child: Image.asset('assets/img/bem-trilogi-logo.png'),
          )),
    );
  }
}

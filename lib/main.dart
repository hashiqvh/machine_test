import 'package:flutter/material.dart';
import 'package:machine_test/core/const/constants.dart';
import 'package:machine_test/core/provider/auth_provider.dart';
import 'package:machine_test/ui/signup/signup_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Machine Test',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Constants.backgroundColor),
        home: SignupPage(),
      ),
    );
  }
}

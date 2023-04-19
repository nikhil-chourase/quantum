import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quantum/screens/login_screen.dart';
import 'package:quantum/screens/news_screen.dart';
import 'package:quantum/screens/sign_up_screen.dart';

import 'google_sign_in.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(

      create: (BuildContext context) => GoogleSignInProvider(),
      child: MaterialApp(
        initialRoute: NewsScreen.id,
        routes: {
          LoginScreen.id :(context)=> LoginScreen(),
          SignUpScreen.id :(context) => SignUpScreen(),
          NewsScreen.id : (context) => NewsScreen(),
        },
      ),
    );
  }
}



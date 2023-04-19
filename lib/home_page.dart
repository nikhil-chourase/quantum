import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quantum/screens/login_screen.dart';
import 'package:quantum/screens/news_screen.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          else if(snapshot.hasData){
            return NewsScreen();
          }
          else if(snapshot.hasError){
            return Center(child: Text('Something went Wrong!'),);
          }

          else{
            return LoginScreen();
          }

        },

      ),
    );
  }
}

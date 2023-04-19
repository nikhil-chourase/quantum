import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quantum/screens/sign_up_screen.dart';

import '../google_sign_in.dart';
import '../widgets/big_text.dart';
import '../widgets/upper_socialx.dart';
import 'news_screen.dart';


class LoginScreen extends StatefulWidget {

  static String id = 'loginScreen';


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.grey.shade400,

        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            child: Column(
              children: [

                UpperSocialX(),
                SizedBox(height: 10,),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 45,right: 45,top: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(text: 'SignIn into your \n Account', size: 30, color: Colors.red, fontWeight: FontWeight.w600),
                            SizedBox(height: 20,),
                            BigText(text: 'Email', size: 17, color: Colors.black, fontWeight: FontWeight.w600),
                            TextField(

                              onChanged: (value) {
                                email = value;
                                //Do something with the user input.
                              },

                              decoration: InputDecoration(
                                hintText: '',
                                suffixIcon: Icon(Icons.mail,color: Colors.red,),
                              ),
                            ),
                            SizedBox(height: 20,),
                            BigText(text: 'Password', size: 17, color: Colors.black, fontWeight: FontWeight.w600),
                            TextField(
                              obscureText: true,
                              onChanged: (value) {
                                password = value;
                                //Do something with the user input.
                              },


                              decoration: InputDecoration(
                                hintText: '',
                                suffixIcon: Icon(Icons.lock,color: Colors.red,),

                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              padding: EdgeInsets.only(left: 180),
                              child: BigText(text: 'Forgot Password ?', size: 16, color: Colors.red, fontWeight: FontWeight.w800),
                            ),

                            SizedBox(height: 15,),
                            Container(
                              padding: EdgeInsets.only(left: 120),
                              child: BigText(text: 'Login with', size: 15, color: Colors.black, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(

                                  onPressed: () {

                                    final provider  = Provider.of<GoogleSignInProvider>(context,listen: false );

                                    provider.googleLogin();




                                  },
                                  child: Container(
                                    child: Image.asset('images/google.png'),

                                    height: 27.0,
                                  ),
                                ),
                                MaterialButton(

                                  onPressed: () {

                                  },
                                  child: Icon(Icons.facebook,color: Colors.blue,),),
                              ],
                            ),

                            //SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: 'Don\'t  have an account ?', size: 15, color: Colors.grey.shade600, fontWeight: FontWeight.w400),
                                MaterialButton(

                                  onPressed: () {
                                    Navigator.pushNamed(context, SignUpScreen.id);
                                  },
                                  child: BigText(text: 'Register', size: 15, color: Colors.red, fontWeight: FontWeight.w800),),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30),),
                    color: Colors.red.shade800,
                  ),
                  child: MaterialButton(
                    onPressed: () async{
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);

                        if(user != null){
                          Navigator.pushNamed(context, NewsScreen.id);
                        }
                      }catch(e){
                        print(e);
                      }
                    },
                    child: Center(
                      child: BigText(
                        text: 'LOG IN',
                        size: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quantum/widgets/upper_social1.dart';

import '../widgets/big_text.dart';
import 'login_screen.dart';
import 'news_screen.dart';


class SignUpScreen extends StatefulWidget {

  static String id = 'signUpScreen';


  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


  final _auth = FirebaseAuth.instance;



  bool flag = false;



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
                UpperSocial1(),
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
                            BigText(text: 'Create an \n Acount', size: 30, color: Colors.red, fontWeight: FontWeight.w600),
                            SizedBox(height: 20,),
                            BigText(text: 'Name', size: 17, color: Colors.black, fontWeight: FontWeight.w600),
                            TextField(


                              decoration: InputDecoration(
                                hintText: '',
                                suffixIcon: Icon(Icons.person,color: Colors.red,),
                              ),
                            ),
                            SizedBox(height: 20,),
                            BigText(text: 'Email', size: 17, color: Colors.black, fontWeight: FontWeight.w600),
                            TextField(
                              onChanged: (value){
                                email = value;
                              },

                              decoration: InputDecoration(
                                hintText: '',
                                suffixIcon: Icon(Icons.mail,color: Colors.red,),

                              ),
                            ),
                            SizedBox(height: 10,),
                            BigText(text: 'Contact no.', size: 17, color: Colors.black, fontWeight: FontWeight.w600),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Container(
                                  child: Image.asset('images/flag_india.png'),
                                  height: 30,
                                  width: 30,
                                ),
                                // SizedBox(width: 45,),
                                Container(
                                  width: 200,
                                  child: TextField(

                                    decoration: InputDecoration(
                                      hintText: '',
                                      suffixIcon: Icon(Icons.call,color: Colors.red,),
                                    ),
                                  ),
                                ),
                              ],
                            ),


                            SizedBox(height: 10,),
                            BigText(text: 'Password', size: 17, color: Colors.black, fontWeight: FontWeight.w600),


                            TextField(
                              onChanged: (value){
                                password = value;
                              },

                              decoration: InputDecoration(
                                hintText: '',
                                suffixIcon: Icon(Icons.lock,color: Colors.red),

                              ),
                            ),



                            SizedBox(height: 20,),
                            Row(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                  value: flag,
                                  onChanged: (bool? value) {
                                    setState((){
                                      flag = value!;

                                    });
                                  },

                                ),
                                BigText(text: 'I agree with', size: 15, color: Colors.grey.shade600, fontWeight: FontWeight.w400),
                                SizedBox(width: 5,),
                                BigText(text: 'Term & condition', size: 15, color: Colors.red, fontWeight: FontWeight.w800),



                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: 'Already have an account ?', size: 15, color: Colors.grey.shade600, fontWeight: FontWeight.w400),
                                MaterialButton(

                                    onPressed: () {
                                      Navigator.pushNamed(context, LoginScreen.id);
                                    },
                                    child: BigText(text: 'Sign In!', size: 15, color: Colors.red, fontWeight: FontWeight.w800)),

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
                      print(email);
                      print(password);

                      try {
                        final newUser = await _auth
                            .createUserWithEmailAndPassword(
                            email: email, password: password);

                        if(newUser != null){
                          Navigator.pushNamed(context, NewsScreen.id);
                        }
                      }catch(e){
                        print(e);
                      }

                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    child: Center(
                      child: BigText(
                        text: 'REGISTER',
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

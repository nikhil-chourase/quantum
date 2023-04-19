import 'package:flutter/material.dart';

import '../screens/login_screen.dart';
import '../screens/sign_up_screen.dart';
import 'big_text.dart';



class UpperSocialX extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),),
        color: Colors.red.shade800,
      ),


      child: Column(
        children: [
          Container(
            height: 80,
            padding: EdgeInsets.only(left: 30,top: 20),

            child: Row(

              children: [
                BigText(
                  text: 'Social',
                  color: Colors.grey.shade300,
                  size: 30,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(width: 5,),
                BigText(text: 'X', size: 40, color: Colors.white,fontWeight: FontWeight.w400,),
              ],
            ),


          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30),),
            ),

            child: Row(
              children: [
                Expanded(
                  child: Container(
                    //width: 160,
                    decoration: BoxDecoration(
                      color: Colors.red.shade800,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),),
                    ),

                    child: MaterialButton(
                      onPressed: (){
                        Navigator.pushNamed(context, LoginScreen.id);

                      },
                      child: Center(
                        child: BigText(text: 'LOGIN',size: 16,color: Colors.grey,fontWeight: FontWeight.w500,),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    //width: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),),
                      color: Colors.white,
                    ),

                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpScreen.id);

                      },
                      child: Center(
                        child: BigText(text: 'SIGN UP',size: 16,color: Colors.grey,fontWeight: FontWeight.w500,),

                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

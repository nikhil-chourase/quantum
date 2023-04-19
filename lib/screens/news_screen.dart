import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/customListTile.dart';
import '../google_sign_in.dart';
import '../model/article_model.dart';
import '../services/api_service.dart';


class NewsScreen extends StatefulWidget {

  static String id = 'NewsScreen';



  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  final _auth = FirebaseAuth.instance;


  ApiService client  = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 5,top: 5),
              child: TextField(

                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search,color: Colors.blue,),

                    hintText: '  Search in feed',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                    )
                ),

                style: TextStyle(
                  color: Colors.blue,

                ),
              ),
            ),
          ),
          IconButton(
              icon: Icon(Icons.logout_rounded,color: Colors.blue,),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);

                final provider  = Provider.of<GoogleSignInProvider>(context,listen: false );

                provider.googleLogout();


                //Implement logout functionality
              }),

        ],
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          //let's check if we got a response or not
          if (snapshot.hasData) {
            //Now let's make a list of articles


            List<Article>? articles = snapshot.data;

            return ListView.builder(
              //Now let's create our custom List tile
              itemCount: articles!.length,
              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

    );
  }
}

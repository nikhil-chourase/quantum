import 'package:flutter/material.dart';

import '../model/article_model.dart';
import '../pages/article_details_page.dart';



Widget customListTile(Article article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(
                article: article,
              )));
    },
    child: Container(
      height: 180,
      width: 470,
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3.0,
          ),
        ],),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        borderOnForeground: true,
        elevation: 10.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(

              children: [
                Container(

                  height: 50,
                  width: 200,
                  margin: EdgeInsets.only(top: 10,left: 10),
                  padding: EdgeInsets.only(top: 10,left: 10),
                  child: Text(
                    article.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.blue
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Container(
                  height: 50,
                  width: 200,
                  margin: EdgeInsets.only(top: 10,left: 10),
                  padding: EdgeInsets.only(top: 10,left: 10),
                  child: Text(
                    article.description,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      color: Colors.blue,
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(
              width : 8.0,
            ),
            Container(
              height: 100.0,
              width: 100,
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                //let's add the height

                image: DecorationImage(
                    image: NetworkImage(article.urlToImage), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            // SizedBox(
            //   height: 8.0,
            // ),
            // Container(
            //   padding: EdgeInsets.all(6.0),
            //   decoration: BoxDecoration(
            //     color: Colors.red,
            //     borderRadius: BorderRadius.circular(30.0),
            //   ),
            //   child: Text(
            //     article.source.name,
            //     style: TextStyle(
            //       color: Colors.white,
            //     ),
            //   ),
            // ),


          ],
        ),
      ),
    ),
  );
}
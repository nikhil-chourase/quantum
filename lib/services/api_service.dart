import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/article_model.dart';



const apikey = '2fb0d2e828ec44388e8e2f8fb2499cac';


class ApiService{
  final endPoint = 'newsapi.org';
  final client = http.Client();





  Future<List<Article>> getArticle() async {

    final queryParameters  = {
      'sources': 'techcrunch',
      'apikey': apikey,
    };

    final uri = Uri.https(endPoint, '/v2/top-headlines',queryParameters);

    final reponse = await client.get(uri);

    Map<String,dynamic> json = jsonDecode(reponse.body);
    List<dynamic> body = json['articles'];


    List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();


    return articles;



    //
    // //first of all let's check that we got a 200 status code: this mean that the request was a succes
    // if (res.statusCode == 200) {
    //   Map<String, dynamic> json = jsonDecode(res.body);
    //
    //   List<dynamic> body = json['articles'];
    //
    //   //this line will allow us to get the different articles from the json file and putting them into a list
    //   List<Article> articles =
    //   body.map((dynamic item) => Article.fromJson(item)).toList();
    //
    //   return articles;
    // } else {
    //   throw ("Can't get the Articles");
    // }
  }
}
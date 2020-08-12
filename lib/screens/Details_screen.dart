import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:receipe/constants.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({this.recipeData});

  final recipeData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCyanColor,
      body: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: kSearchBoxShadow,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.network(
              '${recipeData["image"]}',
              height: MediaQuery.of(context).size.height * 0.30,
              fit: BoxFit.fitWidth,
            ),
            Text(
              '${recipeData["label"]}',
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

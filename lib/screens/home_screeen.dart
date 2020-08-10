import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:receipe/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: kCyanColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: RecipeSearch(),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100.0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
                    child: ListView(
                      children: <Widget>[],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(0.0),
            decoration: BoxDecoration(
              color: kCyanColor,
              boxShadow: kSearchBoxShadow,
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: TextField(
              textAlign: TextAlign.center,
              cursorColor: Colors.white,
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(
                fontFamily: kFontArch,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.0,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Eg.chicken',
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0)
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            padding: EdgeInsets.all(0.0),
            decoration: BoxDecoration(
              color: kCyanColor,
              boxShadow: kSearchBoxShadow,
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: FlatButton(
              onPressed: (){},
              child: Text(
                'Search',
                style: TextStyle(
                  fontFamily: kFontArch,
                ),
              ),
            ),
          ),
        ],
    );
  }
}

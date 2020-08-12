import 'package:flutter/material.dart';
import 'package:receipe/constants.dart';
import 'package:receipe/services/networks.dart';

class RecipeSearch extends StatefulWidget {
  @override
  _RecipeSearchState createState() => _RecipeSearchState();
}

class _RecipeSearchState extends State<RecipeSearch> {
  String recipesName;
  TextEditingController _myController = TextEditingController();

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: kCyanColor,
            boxShadow: kSearchBoxShadow,
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: TextField(
            controller: _myController,
            onChanged: (val) {
              recipesName = val;
            },
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
              suffixIcon: Icon(Icons.search,color: Colors.white54,),
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
            onPressed: () async {
              _myController.clear();
              Navigator.pop(context);
              NetworkRequest networkRequest =  NetworkRequest(recipeName: recipesName);
              await networkRequest.getData();
              recipesName = null;
            },
            child: Text(
              'Search Recipes',
              style: TextStyle(
                fontFamily: kFontArch,
                fontSize: 17.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

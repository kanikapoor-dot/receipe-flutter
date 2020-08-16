import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:receipe/constants.dart';
import 'package:flutter/cupertino.dart';

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
    return Scaffold(
      backgroundColor: kCyanColor,
      body: SafeArea(
        child: GestureDetector(
          onHorizontalDragUpdate: (details) {
            if(details.delta.dx > 1){
              Navigator.pop(context,[0]);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10.0,top: 10.0),
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: kSearchBoxShadow,
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: IconButton(
                  padding: EdgeInsets.all(0.0),
                  onPressed: (){
                    Navigator.pop(context,[0]);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: kCyanColor,
                    size: 20.0,
                  )
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
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
                          letterSpacing: 2.0,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Eg.chicken',
                          suffixIcon: IconButton(
                              onPressed: () {
                                _myController.clear();
                              },
                              icon: Icon(
                                Icons.close,
                              )),
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
                          Navigator.pop(context, [1,recipesName]);
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

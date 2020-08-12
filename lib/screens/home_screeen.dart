import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:receipe/constants.dart';
import 'package:receipe/screens/Details_screen.dart';
import 'package:receipe/screens/search_screen.dart';
import 'package:receipe/services/networks.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _recipeData;

  @override
  void initState() {
    getRecipeData();
    super.initState();
  }

  getRecipeData() async {
    _recipeData = await NetworkRequest(recipeName: 'Chicken').getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: kCyanColor,
      drawer: Drawer(
        child: Container(
            color: kCyanColor,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: RecipeSearch()),
      ),
      appBar: AppBar(
        backgroundColor: kCyanColor,
        elevation: 2.0,
        title: Text(
          'EatNew',
          style: TextStyle(
              fontFamily: kFontArch,
              fontWeight: FontWeight.w900,
              fontSize: 25.0),
        ),
      ),
      body: SafeArea(
        child: _recipeData != null
            ? ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return recipeListBuildContainer(context, index);
                },
              )
            : Text('No Data'),
      ),
    );
  }

  Container recipeListBuildContainer(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: MediaQuery.of(context).size.height * 0.20,
      decoration: BoxDecoration(
        boxShadow: kSearchBoxShadow,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailScreen(recipeData: _recipeData[index]["recipe"])),
          );
        },
        padding: EdgeInsets.all(0),
        child: Card(
          color: Colors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '${_recipeData[index]["recipe"]["label"]}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Calories: ${_recipeData[index]["recipe"]["calories"]}',
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Container(
                child:
                    Image.network('${_recipeData[index]["recipe"]["image"]}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

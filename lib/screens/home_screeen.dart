import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:receipe/constants.dart';
import 'package:receipe/model/recipemodel.dart';
import 'package:receipe/screens/search_screen.dart';
import 'package:receipe/services/networks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<RecipeModel> recipes = new List();
  bool _isLoaded = false;
  @override
  void initState() {
    getRecipeData();
    super.initState();
  }

  getRecipeData([String searchName = 'Chicken']) async {
    recipes = new List();
    var recipeData = await NetworkRequest(recipeName: searchName).getData();
    recipeData.forEach((element) {
      RecipeModel recipeModel = RecipeModel.fromMap(element['recipe']);
      recipes.add(recipeModel);
    });
    setState(() {
      _isLoaded = true;
    });
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
        child: _isLoaded
            ? ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: kSearchBoxShadow,
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: EdgeInsets.all(10.0),
              child: ListTile(
                title: Text(
                  recipes[index].label,
                  style: TextStyle(color: Colors.black),
                ),
                subtitle: Text(
                  recipes[index].source,
                  style: TextStyle(color: Colors.black87),
                ),
                trailing: Image.network(recipes[index].image),
              ),
            );
          },
        )
            : Center(
          child: SpinKitCircle(
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }

}

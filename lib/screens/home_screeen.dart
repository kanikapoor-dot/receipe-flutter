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
  bool _noData = false;

  @override
  void initState() {
    getRecipeData();
    super.initState();
  }

  getRecipeData([String searchName = 'Chicken']) async {
    recipes = new List();
    setState(() {
      _isLoaded = false;
    });
    var recipeData = await NetworkRequest(recipeName: searchName).getData();
    if (recipeData.length == 0) {
      _noData = true;
    } else {
      recipeData.forEach((element) {
        _noData = false;
        RecipeModel recipeModel = RecipeModel.fromMap(element['recipe']);
        recipes.add(recipeModel);
      });
    }

    setState(() {
      _isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: kCyanColor,
      appBar: AppBar(
        backgroundColor: kCyanColor,
        title: Text(
          'EatNew',
          style: TextStyle(
              fontFamily: kFontArch,
              fontWeight: FontWeight.w700,
              fontSize: 20.0),
        ),
        actions: <Widget>[
          IconButton(
            tooltip: 'Search Recipes',
            icon: Icon(Icons.search),
            onPressed: () async {
              List searchValue = await Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => RecipeSearch()),
              );
              if (searchValue[0] == 1) {
                getRecipeData(searchValue[1]);
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          onHorizontalDragUpdate: (details) async {
            if (details.delta.dx < -1) {
              List searchValue = await Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => RecipeSearch()),
              );
              if (searchValue[0] == 1) {
                getRecipeData(searchValue[1]);
              }
            }
          },
          child: _isLoaded
              ? !_noData
                  ? GridBuilderMyCustom(recipes: recipes)
                  : Container(
                      margin: EdgeInsets.all(10.0),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: kSearchBoxShadow,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("assets/images/emptyList.png"),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Sorry ! No recipes found on your search.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: kCyanColor,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w300,
                                fontFamily: kFontArch,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
              : Center(
                  child: SpinKitCircle(
                    color: Colors.white,
                    size: 50,
                  ),
                ),
        ),
      ),
    );
  }
}

class GridBuilderMyCustom extends StatelessWidget {
  const GridBuilderMyCustom({
    Key key,
    @required this.recipes,
  }) : super(key: key);

  final List<RecipeModel> recipes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200.0),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.20,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: kSearchBoxShadow,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(5.0),
                bottomLeft: Radius.circular(5.0)),
          ),
          margin: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0)),
                  child: Image.network(
                    recipes[index].image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      recipes[index].label,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      recipes[index].source,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 10.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

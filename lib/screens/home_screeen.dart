import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'EatNew',
          style: TextStyle(
              color: Colors.lightBlue,
              fontFamily: 'Architects_Daughter',
              fontSize: 25.0),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Material(
                      elevation: 5.0,
                      shadowColor: Colors.white,
                      child: TextField(
                        textCapitalization: TextCapitalization.sentences,
                        keyboardType: TextInputType.text,
                        onChanged: (vl) {
                          print(vl);
                        },
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                        cursorColor: Colors.lightBlue,
                        autocorrect: true,
                        autofocus: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.room_service,
                            color: Colors.lightBlue,
                          ),
                          border: InputBorder.none,
//                          focusedBorder: InputBorder.none,
//                          enabledBorder: InputBorder.none,
//                          disabledBorder: InputBorder.none,
//                          errorBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Search Recipes',
                        style: TextStyle(
                          fontFamily: 'Architects_Daughter',
                          fontWeight: FontWeight.w700,
                          fontSize: 17.0,
                        ),
                      ),
                      color: Colors.lightBlue,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

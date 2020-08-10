import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kApiKey = 'https://api.edamam.com/search?&app_id=6db5e15c&app_key=2adc6f050867b14845dc1ed7fd30cc07';
const kCyanColor = Color(0xff03989E);

const kSearchBoxShadow =  [
  BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.5),
    offset: Offset(9.0, 9.0),
    blurRadius: 36.0,
  ),
  BoxShadow(
    color: Color.fromRGBO(4, 199, 207, 1.0),
    offset: Offset(-9.0, -9.0),
    blurRadius: 36.0,
  ),
];
const kFontArch = 'Architects_Daughter';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const apiKey = 'https://api.edamam.com/search?q=chicken&app_id=6db5e15c&app_key=2adc6f050867b14845dc1ed7fd30cc07';
const kCyanColor = Color(0xff03989E);

const kSearchBoxShadow =  [
  BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.3),
    offset: Offset(6.0, 3.0),
    spreadRadius: 2.0,
    blurRadius: 20.0,
  ),
  BoxShadow(
    color: Color.fromRGBO(179, 240, 242, 0.4),
    offset: Offset(-6.0, -6.0),
    spreadRadius: 1.0,
    blurRadius: 20.0,
  ),
];
const kFontArch = 'Architects_Daughter';
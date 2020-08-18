import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:receipe/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({@required this.websiteUrl});

  final String websiteUrl;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String finalUrl;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    finalUrl = widget.websiteUrl;
    if (finalUrl.contains('http://')) {
      finalUrl = widget.websiteUrl.replaceAll('http://', 'https://');
      print(finalUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCyanColor,
      appBar: AppBar(
        backgroundColor: kCyanColor,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'EatNew',
          style: TextStyle(
              fontFamily: kFontArch,
              fontWeight: FontWeight.w700,
              fontSize: 20.0),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: finalUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController){
            setState(() {
              _controller.complete(webViewController);
            });
          },
        ),
      ),
    );
  }
}

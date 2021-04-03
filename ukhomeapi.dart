import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:html/dom.dart';
import 'package:mailclone/post.dart';
import 'package:mailclone/post_details.dart';
import 'package:mailclone/card_display.dart';


class mainBody extends StatefulWidget {
  final int botIndex;
  mainBody(this.botIndex);


  @override
  _mainBodyState createState() => _mainBodyState();
}

class _mainBodyState extends State<mainBody> {
  bool _isRequestSent = false;
  List<Post> postList = [];
  //send request function here
  void _sendRequest(botIndex) async {
    String link = "https://content.guardianapis.com/search?order-by=newest&q=UK&api-key=6f47359c-bb53-4f0e-88b7-6556f67cb122&show-fields=thumbnail";
    http.Response response = await http.get(link);
    Map decode = json.decode(response.body);
    List results = decode["response"]["results"];
    for (var jsonObject in results) {
      var post = Post.getPostFrmJSONPost(jsonObject);
      postList.add(post);
      print(post);
    }
    setState(() => _isRequestSent = true);
  }
  //main widget here

  @override
  Widget build(BuildContext context) {
    if (!_isRequestSent) {
      _sendRequest(widget.botIndex);
    }
    return Container(
      alignment: Alignment.center,
      child: !_isRequestSent
          ? new CircularProgressIndicator()
          : new Container(
        child: new ListView.builder(
            itemCount: postList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int tileIndex){
              return _getPostWidgets(tileIndex);
            }
        ),
      ),
    );
  }

  Widget _getPostWidgets(int tileIndex) {
    var post = postList[tileIndex];
    return new GestureDetector(
      onTap: () {
        openDetailsUI(post);
      },

      child: new Container(
        //make the 450 bigger later
        height: tileIndex==0? 450:150,
        //margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: new Card(
            child: cardTing(post,tileIndex)
        ),
      ),
    );
  }

  openDetailsUI(Post post) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => new PostDetails(post)));
  }}


import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mailclone/post.dart';
import 'package:mailclone/post_details.dart';
import 'package:http/http.dart' as http; // For network calls


class mainBody extends StatefulWidget {
  @override
  _mainBodyState createState() => _mainBodyState();
}

class _mainBodyState extends State<mainBody> {
  bool _isRequestSent = false;
  List<Post> postList = [];
  //send request function here
  void _sendRequest() async {
    String url = "https://api.nytimes.com/svc/topstories/v2/technology"
        ".json?api-key=WFMWUwCHTFnJR9RRjay9GZUeGSG9FFhk";
    http.Response response = await http.get(url);
    Map decode = json.decode(response.body);
    List results = decode["results"];
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
      _sendRequest();
    }
    return new Container(
      alignment: Alignment.center,
      child: !_isRequestSent
        ? new CircularProgressIndicator()
          : new Container(
        child: new ListView.builder(
          itemCount: postList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index){
            return _getPostWidgets(index);
          }
        ),
      ),
    );
  }
  Widget _getPostWidgets(int index) {
    var post = postList[index];
    return new GestureDetector(
      onTap: () {
        openDetailsUI(post);
      },
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: new Card(
          elevation: 3.0,
          child: new Row(
            children: <Widget>[
              new Container(
                width: 150.0,
                child: new Image.network(
                  post.thumbUrl,
                  fit: BoxFit.cover,
                ),
              ),
              new Expanded(
                  child: new Container(
                    margin: new EdgeInsets.all(10.0),
                    child: new Text(
                      post.title,
                      style: new TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  )),

            ],
          ),
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






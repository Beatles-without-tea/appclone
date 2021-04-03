import 'package:flutter/material.dart';
import 'package:mailclone/post.dart';
import 'package:mailclone/post_details.dart';


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
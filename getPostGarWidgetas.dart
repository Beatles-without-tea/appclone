import 'package:flutter/material.dart';
import 'package:mailclone/post_guardain.dart';
import 'package:mailclone/post_details.dart';
import 'package:mailclone/postDetailsGar.dart';


Widget _getPostGarWidgets(int index) {
  var postGar = postList[index];
  return new GestureDetector(
    onTap: () {
      openDetailsUI(postGar);
    },
    child: new Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: new Card(
        elevation: 3.0,
        child: new Row(
          children: <Widget>[
            new Container(
              width: 150.0,
             // child: new Image.network(
               // post.thumbUrl,
                //fit: BoxFit.cover,
              ),

            new Expanded(
                child: new Container(
                  margin: new EdgeInsets.all(10.0),
                  child: new Text(
                    postGar.title,
                    style: new TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                )),

          ],
        ),
      ),
    ),
  );
}
openDetailsUI(PostGuardian postGar) {
  Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (BuildContext context) => new PostDetailsGar(postGar)));
}
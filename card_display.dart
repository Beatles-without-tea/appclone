import 'package:flutter/material.dart';
import 'package:mailclone/post.dart';




class cardTing extends StatelessWidget {
  var post;
  int tileIndex;
  cardTing(this.post,this.tileIndex);
  @override
  Widget build(BuildContext context) {
    return tileIndex==0? Container(
      //width:1500,
      //height:1000,
      child: Column(children:[
        Container(
        margin: EdgeInsets.all(10),
            child:Text( post.title,
          style: new TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
      )
    ), //SizedBox(height:20,),
        Container(
          width:400,
          height:250,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical:3),
          child:new Image.network(
        post.thumbUrl,
        fit: BoxFit.fill,
    ),
    ),
        //SizedBox(height:20,),
        Container(
          width:385,
          color:Colors.grey[200],
          child: Text(post.summary.substring(0,270)+'...'
              ,style: TextStyle(fontSize:15,)),

          ),
      ],
      ),
      )
    :
    new Row(
      children: <Widget>[
        new Container(
          margin: EdgeInsets.all(10),
          width: 150.0,
          child: new Image.network(
            post.thumbUrl,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height:20,),
        new Expanded(
            child: new Column(
              children:[   SizedBox(height:7,),
                new Text(
                post.title,
                style: new TextStyle(color: Colors.black, fontSize: 15.0),

              ),
            SizedBox(height:5,),
            new Text(
                post.summary.substring(0,108)+'...',
                style: new TextStyle(color: Colors.black, fontSize: 13.0),)
              ],
            )),

      ],
    );
  }
}

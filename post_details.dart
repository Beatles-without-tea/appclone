import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mailclone/post.dart';
import 'package:web_scraper/web_scraper.dart';


class PostDetails extends StatefulWidget {
  final Post post;
  final int botIndex;
  PostDetails(this.post,this.botIndex);

  @override
  State<StatefulWidget> createState() => new _PostDetailsState(post);
}

class _PostDetailsState extends State<PostDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final Post post;

  _PostDetailsState(this.post);

  @override
  Widget build(BuildContext context) => new Scaffold(
    appBar: new AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.white,),

        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor:widget.botIndex==0? Color(0xFF3A5A98):widget.botIndex==1? Color(0xFFD32F2F) :widget.botIndex==2? Color(0xFF3A5A98): widget.botIndex==3? Colors.purple:Color(0xFF3A5A98) ,
      centerTitle: true,
      title:
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        Image.asset(
        'assets/images/m2_icon.png',
        fit: BoxFit.contain,
        height: 32,
        color:Colors.white,
      ),
      new Text(
        widget.botIndex==0?'UK Home':widget.botIndex==1? 'UK Showbiz':widget.botIndex==2? 'Just Pics': widget.botIndex==3?'Femail':'More' ,
        style: new TextStyle(fontSize: 20.0),
        //overflow: TextOverflow.fade, //dunno what this does
      ),
]),
      actions: <Widget>[
        new IconButton(
            icon: new Icon(
              Icons.ios_share,
              color: Colors.white,
            ),
            onPressed: () {
              //_scaffoldKey.currentState.showSnackBar(const SnackBar(
              //content: const Text('Implement a sharing function')));
            }),
      ],
    ),
    body: new Scaffold(
      key: _scaffoldKey,
      body: _postCardView(),
    ),
  );

  Widget _postCardView() {
    return new Container(
      margin: new EdgeInsets.all(10.0),
      child: new Column(
        children: <Widget>[
          new Text(
            post.title,
            textAlign: TextAlign.center,
            style: new TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          new Padding(
            padding: new EdgeInsets.symmetric(vertical: 10.0),
            child: new Divider(
              height: 1.0,
              color: Colors.black,
            ),
          ),
          new Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.access_time,
                color: Colors.grey,
              ),
              new Padding(
                padding: new EdgeInsets.symmetric(horizontal: 10.0),
                child: new Text(getFormattedTime()),
              )
            ],
          ),

          Expanded(
            flex:1,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
          child:
          Column(children:[ new Container(
            width: double.infinity,
            height: 150.0,
            margin: new EdgeInsets.all(10.0),
            child: new Image.network(
              post.thumbUrl,
              fit: BoxFit.cover,
            ),
          ),
            new Text(
          post.summary,

          style: new TextStyle(
          fontSize: 20.0,
          ),
          ),


            ]),
          ),
          ),

        ],
      ),
    );
  }

  String getFormattedTime() {
    var timeStamp = new DateTime.fromMillisecondsSinceEpoch(post.timeStamp);
    var formatter = new DateFormat('dd MMM, yyyy. HH:mm');
    return formatter.format(timeStamp);
  }

}
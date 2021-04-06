import 'package:flutter/material.dart';
class Post {
  String title;
  String summary;
  String thumbUrl;
  int timeStamp;
  String url;

  Post(this.title, this.timeStamp, this.url, this.thumbUrl, this.summary);

  static Post getPostFrmJSONPost(dynamic jsonObject) {
    String title = jsonObject['webTitle'];
    String url = jsonObject['webUrl'];
    //String summary = jsonObject['abstract'];
    Map multiMediaList = jsonObject['fields'];
    // We want an average-quality image or nothing
    String thumbUrl = multiMediaList['thumbnail'];
    String summary = multiMediaList['bodyText'];
    //String thumbUrl = multiMediaList.length > 4? multiMediaList[3]['url'] : "";

    int timeStamp = DateTime.parse(jsonObject['webPublicationDate']).millisecondsSinceEpoch;

    return new Post(title, timeStamp, url, thumbUrl,summary);
  }

  @override
  String toString() {
    return "title = $title; thumbUrl=$thumbUrl "
        "timeStamp = $timeStamp; url = $url; summary=$summary";
  }
}
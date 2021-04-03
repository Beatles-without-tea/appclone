import 'package:flutter/material.dart';
import 'dart:convert'; // Contains the JSON encoder
import 'package:http/http.dart'; // Contains a client for making API calls
import 'package:html/parser.dart'; // Contains HTML parsers to generate a Document object
import 'package:html/dom.dart'; // Contains DOM related classes for extracting data from elements
import 'package:web_scraper/web_scraper.dart';

void initChaptersTitleScrap() async {
  final rawUrl =
      'https://unacademy.com/course/(course-name)';
  final webScraper = WebScraper('https://unacademy.com');
  final endpoint = rawUrl.replaceAll(r'https://unacademy.com', '');
  if (await webScraper.loadWebPage(endpoint)) {
    final titleElements = webScraper.getElement(
        'div.Week__Wrapper-sc-1qeje5a-2 > a.Link__StyledAnchor-sc-1n9f3wx-0 '
            '> div.ItemCard__ItemInfo-xrh60s-1 '
            '> h6.H6-sc-1gn2suh-0',
        []);
    print(titleElements);
    final titleList = <String>[];
    titleElements.forEach((element) {
      final title = element['title'];
      titleList.add('$title');
    });
    print(titleList);
    if (mounted)
      setState(() {
        this.titleList = titleList;
      });
  } else {
    print('Cannot load url');
  }
}

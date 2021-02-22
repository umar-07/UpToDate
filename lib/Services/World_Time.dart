import 'package:flutter/material.dart';
import 'package:http/http.dart' ;
import 'dart:convert';
import'package:intl/intl.dart';

class WorldTime {
  String location;  //location name for the UI
  String time;  //time in that location
  String flag;  //url to asset flg icon
  String url; //location url for api endpoint
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future <void> getTime() async {
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    //print(data);
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    //print(datetime);
    //print(offset);
    DateTime now = DateTime.parse(datetime);
    //print(now);
    now =  now.add(Duration(hours : int.parse(offset)));
    //print(now);
    isDayTime = now.hour > 6 && now.hour <20 ? true : false ;
    time = DateFormat.jm().format(now);     ///Using 'intl' package
  }
}
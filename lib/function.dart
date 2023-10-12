// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:el_adel/Model/Datamodel.dart';
import 'package:el_adel/Variable_declarations.dart';
import 'package:el_adel/jsonconnection.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import 'UserSimplePreferences/UserSimplePreferences.dart';
 jsonconnection ?jsoncon;
 Data? list;
final String url =
    // "http://api.aladhan.com/v1/timingsByCity?city=kuwait&country=kuwait%20Arab%20Emirates&method=5";

    "http://api.aladhan.com/v1/timingsByCity?city=damietta&country=Egypt%20Arab%20Emirates&method=5";

Future getPTData() async {
  var res = await http.get(Uri.parse(Uri.encodeFull(url)));
  final data = jsonDecode(res.body);

  list = Data.fromJson(data);

  return list;
}
List<int> difference(String time_now) {
  var diff = [
    [0, 0],
    [0, 0],
    [0, 0],
    [0, 0],
    [0, 0],
    [0, 0],
    [0, 0]
  ];
  dynamic substr_now = time_now.split(":"), substr;
  dynamic hournow = num.parse(substr_now[0]),
      Minute_now = num.parse(substr_now[1]),
      hour = 0,
      Minute = 0;
  dynamic hour_diff = 0,
      Minute_diff = 0,
      Second_diff = num.parse(substr_now[2]),
      index = 0;

  for (var i = 0; i < 6; i++) {
    substr=time_pray[i].split(":");
    hour = num.parse(substr[0]);
    Minute = num.parse(substr[1])-1;

    hour_diff = hour - hournow;
    if (hour_diff < 0) hour_diff = hour + (24 - hournow);

    Minute_diff = Minute - Minute_now;
    if (Minute_diff < 0) {
      Minute_diff = Minute + (60 - Minute_now);
      if (hour_diff == 0)
        hour_diff = 23;
      else
        hour_diff--;
    }

    diff[i][0] = hour_diff;
    diff[i][1] = Minute_diff;
  }
  hour_diff = diff[0][0];
  Minute_diff = diff[0][1];
  for (int i = 0; i < 5; i++) {
    if (hour_diff > diff[i + 1][0]) {
      hour_diff = diff[i + 1][0];
      Minute_diff = diff[i + 1][1];
      index = i + 1;
    } else if (hour_diff == diff[i + 1][0] && Minute_diff > diff[i + 1][1]) {
      hour_diff = diff[i + 1][0];
      Minute_diff = diff[i + 1][1];
      index = i + 1;
    }
  }
  return [index, hour_diff, Minute_diff];
}

List<int>Calculate_prayer_period(){
  List<int>period=[0,0,0,0,0,0];
  String time=time_pray[5]+":00";
  List<dynamic>diff=difference(time);
  for(int i=0;i<6;i++){
    if(i!=0){
      time=time_pray[i-1]+":00";
      diff=difference(time);
    }
    int hour=diff[1];
    int minute=diff[2];
    period[i]=hour*60+minute;
  }
  return period;
}

Calculate_time(int diff, int hour, int minute) {
  String sec = "", hou = "", m = "";
  if (diff < 10)
    sec = "0$diff";
  else
    sec = "$diff";
  if (hour < 10)
    hou = "0${hour}";
  else
    hou = "${hour}";
  if (minute < 10)
    m = "0${minute}";
  else
    m = "${minute}";

  return "$hou:$m:$sec";
}
class getlocation extends StatefulWidget {
  const getlocation({ Key? key }) : super(key: key);

  @override
  State<getlocation> createState() => _getlocationState();
}

class _getlocationState extends State<getlocation> {
    bool enter=false;
    @override
  void initState() {
      retrievelocation();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPTData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            {
              location=snapshot.data.data.meta.timezone;
              setlocation();
              return Padding(
                padding:  EdgeInsets.all(22),
                child: Text(
                  '${location}',
                  style: TextStyle(
                      shadows: [
                        Shadow(
                            blurRadius: 19,
                            color: Colors.white
                        )
                      ],
                    fontWeight: FontWeight.bold,
                      color:  Colors.deepOrangeAccent,
                      fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              );
            }

          } else {
            return Text(
              '${location}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:Colors.deepOrangeAccent ,
                  fontSize:22 ),
              textAlign: TextAlign.center,
            );
          }
        });
  }
}

void AM(int num) {
  if (num == 2) {
    backgroundimage = 'Images/img25.jpg';
    background_small = 'Images/img4.jpg';
  } else {
    backgroundimage = 'Images/img32.jpg';
    background_small = 'Images/img26.jpg';
  }
  height_small = 40;
  background_color = Colors.black.withOpacity(0.4);
  remain_color = Colors.lightGreen[900]!;
  for (int i = 0; i < colors.length; i++) {
    if (i == num)
      colors[i] = color_selected;
    else
      colors[i] = Colors.white60;
  }
}
void PM(int num) {
  backgroundimage = 'Images/img7.jpg';
  background_small = 'Images/img6.jpg';
  height_small = 20;
 
  remain_color = Colors.teal[200]!;

  for (int i = 0; i < colors.length; i++) {
    if (i == num) {
      colors[i] = color_selected;
      color_selected_int=i;
    } else
      colors[i] = Colors.white70;
  }
}

Widget Layout(int num, ) {
  String image = "";

  if (num == 0)
    image = 'Images/fajr2.jpg';
  else if (num == 2)
    image = 'Images/img32.jpg';
  else if (num == 3)
    image = 'Images/asr1.jpg';
  else if (num == 4)
    image = 'Images/maghrib1.jpg';
  else if (num == 5) image = 'Images/isha2.jpg';

  return Container(
    height: double.infinity,
    width: double.infinity,
    alignment: Alignment.topCenter,
    decoration: BoxDecoration(
      color: const Color(0xff7c94b6),
      image: DecorationImage(
        colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.5), BlendMode.dstATop),
        image: new ExactAssetImage(image),
        fit: BoxFit.fill,
      ),
    ),
    child: Container(
      margin: EdgeInsets.only(top: 10),
      child: num == 2 ?
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white30,
          boxShadow: [
            BoxShadow(
              color: Colors.green[100]!,
              spreadRadius: 10,
              blurRadius: 9,
            )
          ]
        ),
        child: Text(
          'حان الان موعد اذان الظهر',
          style: TextStyle(
            color: Colors.teal,
            fontSize: 22,
            fontFamily: 'font6',
            fontWeight: FontWeight.bold,
          ),
          textAlign:TextAlign.center,
        ),
      ): null,
    ),
  );
}


setlocation()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("location",location);
}
retrievelocation()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  location=prefs.getString("location")??"No Internet";
}
storeinformation()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("Fajr",time_pray[0] );
  prefs.setString("shrouk",time_pray[1]);
  prefs.setString("duhur",time_pray[2]);
  prefs.setString("Asr",time_pray[3]);
  prefs.setString("magrib",time_pray[4]);
  prefs.setString("Isha",time_pray[5]);

}
retrieve_information()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  time_pray[0]=prefs.getString("Fajr" )??"00:00";
  time_pray[1]=prefs.getString("shrouk")??"00:00";
  time_pray[2]=prefs.getString("duhur")??"00:00";
  time_pray[3]=prefs.getString("Asr")??"00:00";
  time_pray[4]=prefs.getString("magrib")??"00:00";
  time_pray[5]=prefs.getString("Isha")??"00:00";

}
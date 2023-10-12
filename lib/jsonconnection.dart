import 'dart:convert';

import 'package:el_adel/Model/Datamodel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class jsonconnection {
  static late double plat;
  static late double plong;
  late Data list;
  Future getPLocatin() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
          plat = position.latitude;
    plong = position.longitude;
    
    String date = DateTime.now().toIso8601String();
    int method = 5;
     final url = "http://api.aladhan.com/v1/timings/$date?latitude=$plat&longitude=$plong&method=$method";
 
 
  http.Response res = await http.get(Uri.parse(url));
 
    final data = json.decode(res.body);

    list = new Data.fromJson(data);

    return list;
  }
}

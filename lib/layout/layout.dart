// ignore_for_file: override_on_non_overriding_member, unused_import

import 'package:el_adel/azkar_masaa.dart';
import 'package:el_adel/azkar_sapah.dart';
import 'package:el_adel/index.dart';
import 'package:el_adel/prayerTimes.dart';
import 'package:el_adel/sebha.dart';
import 'package:flutter/material.dart';

import '../sharedpreferences/sharedpreferences.dart';

class Layoutscreen extends StatefulWidget {
  
  // const Layoutscreen({super.key});

  @override
  State<Layoutscreen> createState() => _LayoutscreenState();
}

class _LayoutscreenState extends State<Layoutscreen> {
  @override
  int index = 0;
  List<Widget> body = [
    prayerTimes(),
    IndexPage(),
    azkarSabah(),
    azkar_masaa(),
    sebha()
  ];
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          // selectedLabelStyle: TextStyle(color: Colors.black),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.night_shelter_outlined),
                label: "الصلاه",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: "المصحف",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.wb_sunny,
                  color: Colors.amber,
                ),
                label: "الصباح",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.nightlight_outlined, ),
                label: "المساء",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.linear_scale_sharp),
                label: "السبحه",
                backgroundColor: Colors.white),
          ]),
      body: body[index],
    );
  }
}

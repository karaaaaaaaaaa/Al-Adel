// ignore_for_file: unused_import

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:el_adel/constants.dart';
import 'package:el_adel/sharedpreferences/sharedpreferences.dart';
import 'package:flutter/material.dart';


class azkarSabah extends StatefulWidget {
  const azkarSabah({Key? key}) : super(key: key);

  @override
  State<azkarSabah> createState() => _azkarSabahState();
}

class _azkarSabahState extends State<azkarSabah> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //       bottomNavigationBar: BottomNavigationBar(
        
        // selectedItemColor: Colors.black ,
        //   unselectedItemColor: Colors.grey,
        //   // selectedLabelStyle: TextStyle(color: Colors.black),
        // showSelectedLabels: true,
        // showUnselectedLabels: true,
        
          
        //     currentIndex: ind,
        //     onTap: (value) {
        //       setState(() {
        //         ind = value;
        //       });
        //     },
        //     items: [
        //       BottomNavigationBarItem(icon: Icon(Icons.night_shelter_outlined), label: "الصلاه",backgroundColor:Colors.white),
        //       BottomNavigationBarItem(icon: Icon(Icons.book), label: "المصحف",backgroundColor:Colors.white),
        //       BottomNavigationBarItem(icon: Icon(Icons.wb_sunny,color: Colors.amber,), label: "الصباح",backgroundColor:Colors.white),
        //       BottomNavigationBarItem(icon: Icon(Icons.nightlight_outlined,color: Colors.black), label: "المساء",backgroundColor:Colors.white),
        //       BottomNavigationBarItem(icon: Icon(Icons.linear_scale_sharp), label: "السبحه",backgroundColor:Colors.white),
        //     ]),
   

        drawer: drawer(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: defultappbar(
                  color: Color.fromARGB(255, 188, 233, 190)
                ),
              ),
              // SizedBox(height: 20,),
              Image.asset("Images/sapah.jpg",
              fit: BoxFit.cover,)
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: unused_import

import 'package:el_adel/constants.dart';
import 'package:el_adel/sharedpreferences/sharedpreferences.dart';
import 'package:flutter/material.dart';

class doaa_motawafy extends StatefulWidget {
  const doaa_motawafy({super.key});

  @override
  State<doaa_motawafy> createState() => _doaa_motawafyState();
}

class _doaa_motawafyState extends State<doaa_motawafy> {
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
          body:
           Container(
              color: Colors.white60,
             child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 10),
                child: defultappbar(
                   color: Color.fromARGB(255, 241, 240, 240)
                ),
              ), 
              SizedBox(height: 60,),
              Container(
                // padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                // color: Colors.yellow[100],
    
    
                ),
                child: Image.asset('Images/dia.jpg',fit: BoxFit.cover,)
              ),
                   
                    Spacer(),
          bottomText(),
          SizedBox(height: 20,)
                ],
              ),
          ),
           ),
      ),
    );
  }
}
// ignore_for_file: unused_import, unused_local_variable

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:el_adel/constants.dart';
import 'package:el_adel/sharedpreferences/sharedpreferences.dart';
import 'package:flutter/material.dart';

class Doaa_istikhaarah extends StatefulWidget {
  const Doaa_istikhaarah({ Key? key }) : super(key: key);

  @override
  State<Doaa_istikhaarah> createState() => _Doaa_istikhaarahState();
}

class _Doaa_istikhaarahState extends State<Doaa_istikhaarah> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
        double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
              color: Colors.yellow[100],


              ),
              child: Text(
                        "اللهم إني أستخيرك بعلمك، وأستقدرك بقدرتك، وأسألك من فضلك العظيم، فإنك تقدر ولا أقدر، وتعلم ولا أعلم، وأنت علام الغيوب، اللهم إن كنت تعلم أن هذا الأمر (ويُسميه بعينه من زواجٍ أو سفرٍ أو غيرهما) خير لي في ديني ومعاشي وعاقبة أمري فاقدره لي، ويسره لي، ثم بارك لي فيه، وإن كنت تعلم أن هذا الأمر شرّ لي في ديني ومعاشي وعاقبة أمري فاصرفه عني، واصرفني عنه، واقدر لي الخير حيث كان، ثم أرضني به",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize:22

                      ),
                    ),
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

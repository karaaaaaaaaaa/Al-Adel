// import 'package:el_adel/Variable_declarations.dart';
// ignore_for_file: unused_import

import 'package:el_adel/constants.dart';
import 'package:el_adel/sharedpreferences/sharedpreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class sebha extends StatefulWidget {
  // const sebha({super.key});

  @override
  State<sebha> createState() => _sebhaState();
}

class _sebhaState extends State<sebha> {
  int count = 0;
  bool countfrist = false;
  bool countSecound = false;
  bool countThird = false;

  void fristresetcount() {
    if (count == 34) {
      setState(() {
        count = 0;
      });
    }
  }

  void secondresetcount() {
    if (count == 101) {
      setState(() {
        count = 0;
      });
    }
  }

  void resetcount() {
    setState(() {
      count = 0;
    });
  }

  void thirdresetcount() {
    if (count == 1001) {
      setState(() {
        count = 0;
      });
    }
  }

  void counticremnal() {
    setState(() {
      count++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //     selectedItemColor: Colors.black,
      //     unselectedItemColor: Colors.grey,
      //     // selectedLabelStyle: TextStyle(color: Colors.black),
      //     showSelectedLabels: true,
      //     showUnselectedLabels: true,
      //     currentIndex: ind,
      //     onTap: (value) {
      //       setState(() {
      //         ind = value;
      //         print(ind);
      //       });
      //     },
      //     items: [
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.night_shelter_outlined),
      //           label: "الصلاه",
      //           backgroundColor: Colors.white),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.book),
      //           label: "المصحف",
      //           backgroundColor: Colors.white),
      //       BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.wb_sunny,
      //             color: Colors.amber,
      //           ),
      //           label: "الصباح",
      //           backgroundColor: Colors.white),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.nightlight_outlined, color: Colors.black),
      //           label: "المساء",
      //           backgroundColor: Colors.white),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.linear_scale_sharp),
      //           label: "السبحه",
      //           backgroundColor: Colors.white),
      //     ]),

      drawer: drawer(context),
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/img/4.png",
                ))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: defultappbar(color: Colors.white54),
            ),
            Center(
                child: Text(
              "التسبيح",
              style: TextStyle(
                color: Colors.black,
                fontSize: 42,
                fontFamily: 'ArefRuqaa',
              ),
            )),
            SizedBox(
              height: 33,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  counticremnal();
                  if (countfrist == true) {
                    fristresetcount();
                  } else if (countSecound == true) {
                    secondresetcount();
                  } else if (countThird == true) {
                    thirdresetcount();
                  }
                  print(count);
                });
              },
              child: CircleAvatar(
                  radius: 180,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/img/1.png"),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 60,
                        child: Text(
                          "$count",
                          style: TextStyle(
                              fontSize: 60, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    radius: 170,
                    backgroundColor: Colors.blue,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(250, 158, 158, 158),
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(10),
                              left: Radius.circular(10))),
                      height: 80,
                      width: 60,
                      child: Center(
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                resetcount();
                              });
                            },
                            icon: Icon(
                              Icons.settings_backup_restore_rounded,
                              size: 44,
                            )),
                      ),
                    )),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      countfrist = false;
                      countSecound = false;
                      // resetcount();
                      countThird = true;
                      // frist();
                      print("countThird = true");
                    });
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: countThird
                                ? Color.fromARGB(255, 108, 181, 240)
                                : Color.fromARGB(250, 158, 158, 158),
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10),
                                left: Radius.circular(10))),
                        height: 80,
                        width: 60,
                        child: Center(
                          child: Text("1000",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w600)),
                        ),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      // resetcount();
                      countfrist = false;
                      countThird = false;
                      countSecound = true;
                      // frist();
                      print(" countSecound = true");
                    });
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: countSecound
                                ? Color.fromARGB(255, 108, 181, 240)
                                : Color.fromARGB(250, 158, 158, 158),
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10),
                                left: Radius.circular(10))),
                        height: 80,
                        width: 60,
                        child: Center(
                          child: Text("100",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w600)),
                        ),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      // resetcount();
                      countfrist = true;
                      countThird = false;
                      countSecound = false;

                      // frist();
                      print(" countfrist = true");
                    });
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            // color:Color.fromARGB(255, 108, 181, 240),

                            color: countfrist
                                ? Color.fromARGB(255, 108, 181, 240)
                                : Color.fromARGB(250, 158, 158, 158),
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10),
                                left: Radius.circular(10))),
                        height: 80,
                        width: 60,
                        child: Center(
                          child: Text("33",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w600)),
                        ),
                      )),
                )
              ],
            )
          ],
        ),
      )),
// ignore: prefer_const_constructors
// appBar: AppBar(title: Text("سبحه"),),
    );
  }
}

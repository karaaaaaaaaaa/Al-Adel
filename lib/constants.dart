// ignore_for_file: unused_local_variable

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:el_adel/Calculate_AM_PM.dart';
import 'package:el_adel/Doaa_istikhaarah.dart';

import 'package:el_adel/azkar_masaa.dart';
import 'package:el_adel/azkar_sapah.dart';
import 'package:el_adel/doaa_motawafy.dart';
import 'package:el_adel/function.dart';
import 'package:el_adel/index.dart';
import 'package:el_adel/prayerTimes.dart';
import 'package:el_adel/sebha.dart';
import 'package:el_adel/settings.dart';
// import 'package:el_adel/tasme3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

import 'UserSimplePreferences/UserSimplePreferences.dart';
import 'main.dart';


Widget bottomText() => TypewriterAnimatedTextKit(
      text: [
        "أَتَخْشَوْنَهُمْ فَاللَّهُ أَحَقُّ أَن تَخْشَوْهُ إِن كُنتُم مُّؤْمِنِينَ",
        "وَلَا تَحْسَبَنَّ اللَّهَ غَافِلًا عَمَّا يَعْمَلُ الظَّالِمُونَ إِنَّمَا يُؤَخِّرُهُمْ لِيَوْمٍ تَشْخَصُ فِيهِ الْأَبْصَارُ",
      ],
      speed: Duration(milliseconds: 30),
      textStyle: TextStyle(
          fontSize: 22,
          shadows: [
            Shadow(blurRadius: 20, color: Colors.blue),
          ],
          color: Colors.red),
    );

class future extends StatefulWidget {
  final AM_PM,Pray,color,screen_width,screen_height,index;
  future(this.AM_PM,this.Pray,this.color,this.screen_width,this.screen_height,this.index);

  @override
  _futureState createState() => _futureState(AM_PM,Pray,color,screen_width,screen_height,index);
}

class _futureState extends State<future>  {
  final AM_PM,Pray,color,screen_width,screen_height,index;
  _futureState(this.AM_PM,this.Pray,this.color,this.screen_width,this.screen_height,this.index);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    retrieve_information();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    String space = "                ", time = "00:00";
     num t=0;double remain_percentage;
    return FutureBuilder(
        future: getPTData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            {
              if (Pray == "الفجر") {
                time = snapshot.data.data.timings.fajr;
                time_pray[0] = time;
              } else if (Pray == "الشروق") {
                time = snapshot.data.data.timings.sunrise;
                time_pray[1] = time;
              } else if (Pray == "الظهر") {
                time = snapshot.data.data.timings.dhuhr;
                time_pray[2] = time;
              } else if (Pray == "العصر") {
                time = snapshot.data.data.timings.asr;
                time_pray[3] = time;
              } else if (Pray == "المغرب") {
                time = snapshot.data.data.timings.maghrib;
                time_pray[4] = time;
              } else if (Pray == "العشاء") {
                time = snapshot.data.data.timings.isha;
                time_pray[5] = time;
              }
              var v=time.split(':');
              t=num.parse(v[0]);
              if(t>12){
                t=t-12;
                time="$t:${v[1]}";
              }
            }
            storeinformation();
          } else {
            if (Pray == "الفجر") {
              time=time_pray[0];
            } else if (Pray == "الشروق") {
              time=time_pray[1];
            } else if (Pray == "الظهر") {
              time=time_pray[2];
            } else if (Pray == "العصر") {
              time=time_pray[3];
            } else if (Pray == "المغرب") {
              time=time_pray[4];
            } else if (Pray == "العشاء") {
              time=time_pray[5];
            }
            var v=time.split(':');
            t=num.parse(v[0]);
            if(t>12){
              t=t-12;
              time="$t:${v[1]}";
            }
          }
          List<int>diff=difference(DateFormat('HH:mm:ss').format(DateTime.now()));
          List<int>prayer_period=Calculate_prayer_period();
          int now_time=diff[1]*60+diff[2];
          int first_time=prayer_period[index];

          int remain_index=diff[0];
          remain_percentage=(now_time/first_time)*100;
          //print("first_time = ${remain_percentage} \t index = ${index} \t remian index = ${remain_index}\n");
          return container_Pray("${time} ${AM_PM}","${Pray}",color,screen_width,screen_height,index,remain_index,remain_percentage);
        });
  }
}
Widget container_Pray(String text,String text2,Color color,double screen_width,double screen_height,int index,int remain_index,double percentage){
  percentage=1-(percentage/100);
  Color perc=percentage>=0.50?Colors.red:percentage>=0.30?Colors.yellow:Colors.green;
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.fromLTRB(screen_width*0.02, screen_height*0.0004, screen_width*0.02, 0),
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: screen_height*0.009,horizontal: screen_width*0.009),
      child: SizedBox(
        height: screen_height*0.07,
        child: LiquidLinearProgressIndicator(
          value: index==remain_index?percentage:100,
          valueColor: AlwaysStoppedAnimation(Colors.lightBlue[100]!),
          backgroundColor: perc,
          borderRadius: screen_width*0.1,
          borderWidth: 2.0,
          borderColor: Colors.red,
          direction: Axis.vertical,
          center: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: screen_width*0.075,
                  fontFamily: 'font2',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: screen_width*0.14,),
              Text(
                text2,
                style: TextStyle(
                  fontSize: screen_width*0.075,
                  fontFamily: 'font2',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
}

Widget defultappbar({Color? color, context,double width=double.infinity}) => Container(
  margin: EdgeInsets.all(8),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(22)),
      width: width,
      height: 68,
      child: Row(
        children: [
          Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu));
          }),
          SizedBox(
            width: 50,
          ),
          Center(
            child: ScaleAnimatedTextKit(
              text: [
                "سبــحـــان  الـلـــه",
                "الحـــمــد  الــلــه",
                "صـــلــي عـلـي الـنـبـي",
                "لا اله إلا الله",
                "الــلــه   أكـــبــر"
              ],
              duration: Duration(seconds: 6),
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ArefRuqaa',
                  fontSize: 33,
                  color: Colors.pink),
            ),
          ),
          Spacer(),
          Container(
           
            child: ImageIcon(
              AssetImage("Images/img1.png"),
              color: Colors.blue,
              size: 42,
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );

Widget drawer(context) => Drawer(
  
    backgroundColor: Colors.black,
    // backgroundColor: Color.fromARGB(255, 32, 82, 34),
    child: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 33, 0, 11),
          child: Column(
            children: [
              CircleAvatar(
                radius: 60.0,
                backgroundImage: ExactAssetImage('Images/img32.jpg'),
              ),
              SizedBox(height: 22,),
              Center(
                child: Container(
                    width: 255,
                    child: Center(
                      child: Text(
                        " اللهمّ اجز الاموات عن الإحسان إحسانًا، وعن الإساءة عفوًا وغفرانًا",
                        style: TextStyle(color: Colors.white,fontSize: 22),
                      ),
                    )),
              ),
                       SizedBox(height: 22,),
                       Container(color:Colors.black,
                       width: double.infinity,
                       height: 1,
                       ),
                      //  SizedBox(height: 22,),
              ListTile(
                title: Text('القرآن الكريم ',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                leading: ImageIcon(
                  AssetImage("Images/img2.png"),
                  color: Colors.red,
                  size: 22,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IndexPage(),
                      ));
                },
              ),
              ListTile(
                leading: ImageIcon(
                  AssetImage("Images/img2.png"),
                  color: const Color.fromRGBO(244, 67, 54, 1),
                  size: 22,
                ),
                title: Text('أذكـــار الصـــبـــاح',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => azkarSabah(),
                      ));
                },
              ),
              ListTile(
                title: Text('أذكـــار المـــســـــاء',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                leading: ImageIcon(
                  AssetImage("Images/img2.png"),
                  color: Colors.red,
                  size: 22,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => azkar_masaa(),
                      ));
                },
              ),
              ListTile(
                title: Text('دعـــاء الاستـــخــاره',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                leading: ImageIcon(
                  AssetImage("Images/img2.png"),
                  color: Colors.red,
                  size: 22,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Doaa_istikhaarah(),
                      ));
                },
              ),
               ListTile(
                title: Text('دعـــاء للميت',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                leading: ImageIcon(
                  AssetImage("Images/img2.png"),
                  color: Colors.red,
                  size: 22,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => doaa_motawafy(),
                      ));
                },
              ),
               ListTile(
                title: Text(' التسبيح',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                leading: ImageIcon(
                  AssetImage("Images/img2.png"),
                  color: Colors.red,
                  size: 22,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => sebha(),
                      ));
                },
              ),
                ListTile(
                title: Text(' تسميع القرآن الكريم',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                leading: ImageIcon(
                  AssetImage("Images/img2.png"),
                  color: Colors.red,
                  size: 22,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => speechScreen(),
                      ));
                },
              ),
              ListTile(
                title: Text('Prayer Times',
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                leading: ImageIcon(
                  AssetImage("Images/img9.png"),
                  color: Colors.white,
                  size: 22,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => prayerTimes(),
                      ));
                },
              ),
                        ListTile(
            leading: const Icon(
              Icons.settings,color: Colors.white,
            ),
            title: const Text(
              'Settings',
              style: TextStyle(color: Colors.white,fontSize: 20),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Settings()));
            },
          ),
            ],
          ),
        )
      ],
    ));

Widget container(String text, Color color,double screen_width,double screen_height) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.fromLTRB(screen_width*0.04,Is_AM_PM? screen_height*0.02:screen_height*0.03, screen_width*0.04,screen_height*0.03),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(right: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              backgroundBlendMode: BlendMode.hardLight,
              color: Colors.white10,
                boxShadow: [
                  BoxShadow(
                    color: Colors.green[100]!,
                    spreadRadius: 7,
                    blurRadius: 9,
                  )
                ]
            ),

            child: ImageIcon(
              AssetImage("Images/img2.png"),
              color: Colors.red[800],
              size: screen_width*0.08,
            ),
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color,
            fontSize: screen_width*0.095,
            fontFamily: 'font4',
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(left: 3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              backgroundBlendMode: BlendMode.hardLight,
              color: Colors.white54,
                boxShadow: [
                  BoxShadow(
                    color: Colors.green[100]!,
                    spreadRadius: 5,
                    blurRadius: 9,
                  )
                ]
            ),
            child: ImageIcon(
              AssetImage("Images/img0.png"),
              color: Colors.red[900],
              size: screen_width*0.08,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget container_time(String text, Color color,double screen_width,double screen_height) {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      color: Colors.white24,
        boxShadow: [
          BoxShadow(
            color: Colors.white10,
            spreadRadius: 8,
            blurRadius: 12,
          )
        ]
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color,
            fontSize: screen_width*0.11,
            fontFamily: 'BungeeShade',
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

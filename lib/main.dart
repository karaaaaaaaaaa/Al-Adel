// ignore_for_file: unused_import

import 'package:el_adel/function.dart';
import 'package:el_adel/layout/layout.dart';
import 'package:el_adel/prayerTimes.dart';
import 'package:el_adel/sharedpreferences/sharedpreferences.dart';
import 'package:el_adel/tasme3.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'Doaa_istikhaarah.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
   void initState() {
    WidgetsBinding
        .instance
        .addPostFrameCallback(

            (_) async{
      await readJson();
      await getSettings();
    }



    );
   
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
       appBarTheme: AppBarTheme(elevation: 0),
        primarySwatch: Colors.red,
      ),
    debugShowCheckedModeBanner: false,
      home: Layoutscreen(),
      
    );
  }
}

class speechScreen extends StatefulWidget {
  // const speechScreen({super.key});

  @override
  State<speechScreen> createState() => _speechState();
}

class _speechState extends State<speechScreen> {
  late stt.SpeechToText _speech;
  bool isListening = false;
  String textspeech = 'press the button to start speaking';
  void onlisten() async {
    if (!isListening ) {
      bool available = await _speech.initialize(
          onStatus: (val) => print("onStatus $val"),
          onError: (val) => print("onError $val"));
      if (available) {
        setState(() {
          isListening = true;
        });
        _speech.listen(
            onResult: (val) => setState(() {
                  textspeech = val.recognizedWords;
                }));
      }
    } else {
      isListening = false;

      _speech.stop();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _speech = stt.SpeechToText();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: Text("Speech to Text ")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: isListening,
        glowColor: Theme.of(context).primaryColor,
        endRadius: 80,
        duration: Duration(milliseconds: 2000),
        repeatPauseDuration: Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: () {
            onlisten();
          },
          child: Icon(isListening ? Icons.mic : Icons.mic_none),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Text(
            textspeech,
            style: TextStyle(fontSize: 19),
          ),
        ),
      ),
    );
  }
}

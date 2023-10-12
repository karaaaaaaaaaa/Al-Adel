// import 'package:avatar_glow/avatar_glow.dart';
// import 'package:flutter/material.dart';


// import 'package:speech_to_text/speech_to_text.dart' as stt;

// class speechScreen extends StatefulWidget {
//   // const speechScreen({super.key});

//   @override
//   State<speechScreen> createState() => _speechState();
// }

// class _speechState extends State<speechScreen> {
//   late stt.SpeechToText _speech;
//   bool isListening = false;
//   String textspeech = 'press the button to start speaking';
//   void onlisten() async {
//     if (!isListening ) {
//       bool available = await _speech.initialize(
//           onStatus: (val) => print("onStatus $val"),
//           onError: (val) => print("onError $val"));
//       if (available) {
//         setState(() {
//           isListening = true;
//         });
//         _speech.listen(
//             onResult: (val) => setState(() {
//                   textspeech = val.recognizedWords;
//                 }));
//       }
//     } else {
//       isListening = false;

//       _speech.stop();
//     }
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     _speech = stt.SpeechToText();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(elevation: 0, title: Text("Speech to Text ")),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: AvatarGlow(
//         animate: isListening,
//         glowColor: Theme.of(context).primaryColor,
//         endRadius: 80,
//         duration: Duration(milliseconds: 2000),
//         repeatPauseDuration: Duration(milliseconds: 100),
//         repeat: true,
//         child: FloatingActionButton(
//           onPressed: () {
//             onlisten();
//           },
//           child: Icon(isListening ? Icons.mic : Icons.mic_none),
//         ),
//       ),
//       body: SingleChildScrollView(
//         reverse: true,
//         child: Container(
//           margin: EdgeInsets.all(10),
//           child: Text(
//             textspeech,
//             style: TextStyle(fontSize: 19),
//           ),
//         ),
//       ),
//     );
//   }
// }

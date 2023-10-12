import 'package:shared_preferences/shared_preferences.dart';

List<String> time_pray = [
  "00:00",
  "00:00",
  "00:00",
  "00:00",
  "00:00",
  "00:00",
];

class UserSimplePreferences {
  static late SharedPreferences preferences;
  static const Fajr = 'fajr';
  static const Shrouk = 'shrouk';
  static const duhr = 'duhr';
  static const Asr = 'Asr';
  static const Magrib = 'magrib';
  static const Asha = 'Asha';
  static Future init() async =>
      preferences = await SharedPreferences.getInstance();
  static Future setfajr(String fajr) async =>
      await preferences.setString(Fajr, fajr);
  static String getfajr() => preferences.getString(Fajr)!;
  static Future setshrouk(String shrouk) async =>
      await preferences.setString(Shrouk, shrouk);
      static String getShrouk()=>preferences.getString(Shrouk)!;
      static Future setduher(String duher) async =>
      await preferences.setString(duhr, duher);

  static String getduher() => preferences.getString(duhr)!;


  static Future setAsr(String Asr1) async =>
      await preferences.setString(Asr, Asr1);

  static String getAsr() => preferences.getString(Asr)!;

  static Future setmagrib(String magrib) async =>
      await preferences.setString(Magrib, magrib);

  static String getmagrib() => preferences.getString(Magrib)!;

  static Future setAsha(String asha) async =>
        await preferences.setString(Asha, asha);

  static String getmAsha() => preferences.getString(Asha)!;
}

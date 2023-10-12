import 'package:intl/intl.dart';

import 'UserSimplePreferences/UserSimplePreferences.dart';

var asr = time_pray[3].split(':');
var sun = time_pray[1].split(':');
var asr_hour = num.parse(asr[0]);
var sun_hour = num.parse(sun[0]);
var asr_minute = num.parse(asr[1]);
var sun_minute = num.parse(sun[1]);
var check_hour = num.parse(DateFormat('HH').format(DateTime.now())),
    check_minute = num.parse(DateFormat('mm').format(DateTime.now()));
var Is_AM_PM = ((check_hour > asr_hour ||
        (check_hour == asr_hour && check_minute > asr_minute)) &&
    (check_hour > sun_hour ||
        (check_hour == sun_hour && check_minute < sun_hour)));

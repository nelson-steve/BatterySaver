import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart' as t;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class TimeZone {
  factory TimeZone() => _this;

  TimeZone._() {
    initializeTimeZones();
  }
  static TimeZone _this = TimeZone._();

  Future<String> getTimeZoneName() async =>
      FlutterNativeTimezone.getLocalTimezone();

  Future<t.Location> getLocation([String? timeZoneName]) async {
    if (timeZoneName == null || timeZoneName.isEmpty) {
      timeZoneName = await getTimeZoneName();
    }
    return t.getLocation(timeZoneName);
  }
}

class TimeClass {
  Future<tz.TZDateTime> getScheduleDate() async {
    final timeZone = TimeZone();
    final dateTime = DateTime(2022, 6, 30, 21, 43);

    // The device's timezone.
    String timeZoneName = await timeZone.getTimeZoneName();

    // Find the 'current location'
    final location = await timeZone.getLocation(timeZoneName);

    final scheduledDate = tz.TZDateTime.from(dateTime, location);

    print(location);
    print(scheduledDate);
    print(dateTime);

    return scheduledDate;
  }
}

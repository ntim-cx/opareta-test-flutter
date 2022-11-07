import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class Utils {
  static Widget verticalSpacer({double space = 20.0}) {
    return SizedBox(height: space);
  }

  static Widget horizontalSpacer({double space = 20.0}) {
    return SizedBox(width: space);
  }

  static String formatDateTime(
    String? dateTime,
  ) {
    if (dateTime != null) {
      DateTime parsedDateTime = DateTime.parse(dateTime);
      String format = "yyyy-MM-ddThh:mm:ss";
      return DateFormat(format).format(parsedDateTime);
    } else {
      return 'Date cannot be formatted';
    }
  }

  static bool checkDataValidity(String timestamp) {
    DateTime parsedDateTime = DateTime.parse(timestamp);
    DateTime currentTime = DateTime.now();
    var diff = currentTime.difference(parsedDateTime).inSeconds;
    log(diff.toString());
    return diff < 6000000;
  }
}

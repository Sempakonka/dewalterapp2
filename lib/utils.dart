import 'package:dbcrypt/dbcrypt.dart' as dbCrypt;
import 'package:flutter/material.dart';

String formatDate(String dbDate) {
  List<String> dateTimeList = dbDate.split(" ");
  List<String> dateList = dateTimeList.first.split("-");
  String dateTime = dateList[1] +
      "-" +
      dateList.last +
      "-" +
      dateList.first +
      " " +
      dateTimeList.last;
  return dateTime;
}

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double screenHeight(BuildContext context,
    {double dividedBy = 1, double reducedBy = 0.0}) {
  return (screenSize(context).height - reducedBy) / dividedBy;
}

double screenHeightExcludingToolbar(BuildContext context,
    {double dividedBy = 1}) {
  return screenHeight(context, dividedBy: dividedBy, reducedBy: kToolbarHeight);
}

bool passwordCheck({required String givenPassword, required String hash}) =>
    dbCrypt.DBCrypt().checkpw(givenPassword, hash);

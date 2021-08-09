import 'package:flutter/material.dart';
import 'package:test_speed_check/models/dataEntry.dart';

class DataTile extends StatelessWidget {
  final DataEntry? entry;
  DataTile({ this.entry });

  String speed = "/";
  String registration = "/";
  String date = "/";
  String time = "/";
  String link = "";

  @override
  Widget build(BuildContext context) {
    if(entry != null) {
      List<String>? temp = entry?.name?.split("_");
      if(temp != null) {
        date = temp[0];
        time = temp[1];
        registration = temp[2];
        speed = temp[3];
      }
    }
    return Padding(
      padding: EdgeInsets.only(top: 5.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: CircleAvatar(
                radius: entry?.name != "Date_Time_Registration_Speed" ? 5.0 : 0.0,
                backgroundColor: Colors.red,
              ),
            ),
            Expanded(
              flex: 3,
                child: Text(speed, textAlign: TextAlign.center),
            ),
            Expanded(
              flex: 3,
              child: Text(registration, textAlign: TextAlign.center),
            ),
            Expanded(
              flex: 5,
              child: Text(date+", "+time, textAlign: TextAlign.center),
            ),
          ],
        )
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_speed_check/models/dataEntry.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:path/path.dart';

class DataNode extends StatefulWidget {
  @override
  _DataNodeState createState() => _DataNodeState();
}

class _DataNodeState extends State<DataNode> {
  String speed = "/";
  String registration = "/";
  String date = "/";
  String time = "/";
  String link = "";

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<List<DataEntry>?>(context);
    data?.sort((b,a) {
      return a.link.toString().compareTo(b.link.toString());
    });
    if(data != null) {
      File file = new File(data[0].link.toString());
      String _basename = basename(file.path);
      String resultBasename = _basename.substring(0, _basename.indexOf('.jpg'));
      print(resultBasename);
      List<String>? temp = data[0].name?.split("_");
      link = data[0].link.toString();
      if(temp != null) {
        date = temp[0];
        time = temp[1];
        registration = temp[2];
        speed = temp[3];
      }
      List<String>? tempLink = resultBasename.split("_");
      if(tempLink != null) {
        date = tempLink[0];
        date = date.replaceAll('-', '/');
        time = tempLink[1];
        time = time.replaceAll('-', ':');
        registration = tempLink[2];
      }
    }
    return Container(
      child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black,
                  image: DecorationImage(
                    image: NetworkImage(link),
                    fit: BoxFit.contain,
                  ),
                //shape: BoxShape.rectangle,
              ),
            ),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(CupertinoIcons.speedometer),
                          title: Text("Speed"),
                          trailing: Text(speed),
                        ),
                        ListTile(
                          leading: Icon(CupertinoIcons.rectangle),
                          title: Text("Registration"),
                          trailing: Text(registration),
                        ),
                        ListTile(
                          leading: Icon(CupertinoIcons.calendar_today),
                          title: Text("Date"),
                          trailing: Text(date),
                        ),
                        ListTile(
                          leading: Icon(CupertinoIcons.clock),
                          title: Text("Time"),
                          trailing: Text(time),
                        ),
                      ],
                    )
                )
            )
          ]
      ),
    );
  }
}

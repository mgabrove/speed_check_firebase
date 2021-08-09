import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_speed_check/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_speed_check/screens/home/data_node.dart';
import 'package:test_speed_check/screens/home/data_list.dart';
import 'package:test_speed_check/models/dataEntry.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int functionalityToggle = 0;

  void _onItemTapped() {
    if (functionalityToggle == 0) {
      setState(() {
        functionalityToggle = 1;
      });
    }
    else if (functionalityToggle == 1) {
      setState(() {
        functionalityToggle = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<DataEntry>?>.value(
      initialData: null,
      value: DatabaseService().images,
        child: Scaffold(
          backgroundColor: Colors.red[50],
          appBar: AppBar(
            title: Text("SpeedCheck"),
            backgroundColor: Colors.red[400],
            elevation: 0.0,
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {_onItemTapped();},
                    child: Icon(
                        CupertinoIcons.arrow_swap
                    ),
                  )
              ),
            ],
          ),
            body: functionalityToggle == 0 ? DataNode() : DataList(),/*Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                ),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: ListView(
                          children: <Widget>[
                            ListTile(
                              leading: Icon(CupertinoIcons.speedometer),
                              title: Text("Speed"),
                              trailing: Text("72km/h"),
                            ),
                            ListTile(
                              leading: Icon(CupertinoIcons.rectangle),
                              title: Text("Registration"),
                              trailing: Text("HN AB18"),
                            ),
                            ListTile(
                              leading: Icon(CupertinoIcons.calendar_today),
                              title: Text("Date"),
                              trailing: Text("22-07-2021"),
                            ),
                            ListTile(
                              leading: Icon(CupertinoIcons.clock),
                              title: Text("Time"),
                              trailing: Text("23:51"),
                            ),
                          ],
                        )
                    )
                )
              ]
          ),*/
        )
      );
  }
}
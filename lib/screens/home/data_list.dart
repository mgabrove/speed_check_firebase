import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_speed_check/models/dataEntry.dart';
import 'package:test_speed_check/screens/home/dataTile.dart';
import 'dart:io';

class DataList extends StatefulWidget {

  @override
  _DataListState createState() => _DataListState();
}

class _DataListState extends State<DataList> {
  @override
  Widget build(BuildContext context) {
    File file = new File("/dir1/dir2/file.ext");
    final data = Provider.of<List<DataEntry>?>(context);
    data?.sort((b,a) {
      return a.link.toString().compareTo(b.link.toString());
    });
    if(data != null) {
      return Column(
        children: <Widget>[
          DataTile(
            entry: DataEntry(
            name: "Date_Time_Registration_Speed",
            link: "")
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
              return DataTile(entry: data[index]);
            },
          )
          )]
      );ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return DataTile(entry: data[index]);
        },
      );
    }
    return Container();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_speed_check/models/dataEntry.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService {

  final CollectionReference speedCollection = Firestore.instance.collection('images');

  final StorageReference _reference = FirebaseStorage.instance.ref();

  Stream<List<DataEntry>?> get images {
    //downloadImage();
    return speedCollection.snapshots()
    .map(_dataListFromSnapshot);
  }

  List<DataEntry>? _dataListFromSnapshot(QuerySnapshot? snapshot) {
    if(snapshot != null) {
      return snapshot.documents.map((doc) {
        return DataEntry(
          name: doc.data['filename'] ?? "",
          link: doc.data['link'] ?? '',
        );
      }).toList();
    }
  }

  Future downloadImage() async {
    //_reference.listAll();
    String downloadAddress = await _reference.getDownloadURL();
    print(downloadAddress);
  }

}
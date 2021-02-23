// import 'package:f_date/models/journal.dart';
import 'package:f_date/services/db_firestore_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DbFirestoreService implements DbApi {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _collectionJournals = 'journals';

  DbFirestoreService() {
    FirebaseFirestore.instance.settings = Settings(
        // host: 'localhost:8080',
        // sslEnabled: false,
        // persistenceEnabled: false,
        );
  }

  // @override
  // Future<bool> addJournal(Journal journal) {
  //   // TODO: implement addJournal
  //   throw UnimplementedError();
  // }
  // 
  // @override
  // void deleteJournal(Journal journal) {
  //   // TODO: implement deleteJournal
  // }
  // 
  // @override
  // Future<Journal> getJournal(String documentID) {
  //   // TODO: implement getJournal
  //   throw UnimplementedError();
  // }
  // 
  // @override
  // Stream<List<Journal>> getJournalList(String uid) {
  //   // Future<dynamic> json;
  //   // json = _firestore
  //   //     .collection('journals')
  //   //     .where('uid', isEqualTo: uid)
  //   //     .get()
  //   //     .then((DocumentSnapshot documentSnapshot) {
  //   //   if (documentSnapshot.exists) {
  //   //     print('Document exists on the database');
  //   //   }
  //   // });
  //   // 
  //   // return json.asStream();
  //   throw UnimplementedError();
  // }
  // 
  // @override
  // void updateJournal(Journal journal) {
  //   // TODO: implement updateJournal
  //   throw UnimplementedError();
  // }
  // 
  // @override
  // void updateJournalWithTransaction(Journal journal) {
  //   // TODO: implement updateJournalWithTransaction
  //   throw UnimplementedError();
  // }
}

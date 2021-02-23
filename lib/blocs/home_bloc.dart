/*
The HomeBloc is responsible for identifying logged-in user credentials 
and monitoring user authentication login status. 

A StreamController listener will monitor the user authentication credentials 
by updating credential status by using sink.add()

If the user si logged in, the sink events send the user uid value, 
if the user logs out it will send null
*/

import 'dart:async';

import 'package:f_date/services/authentication_api.dart';
import 'package:f_date/services/db_firestore_api.dart';

class HomeBloc {
  final DbApi dbApi;
  final AuthenticationApi authenticationApi;

  // final StreamController<List<Journal>> _journalCountroller =
  //     StreamController<List<Journal>>.broadcast();
  // Sink<List<Journal>> get _addListJournal => _journalCountroller.sink;
  // Stream<List<Journal>> get listJournal => _journalCountroller.stream;
  //
  // final StreamController<Journal> _journalDeleteCountroller =
  //     StreamController<Journal>.broadcast();
  // Sink<Journal> get deleteJournal => _journalDeleteCountroller.sink;

  HomeBloc(this.dbApi, this.authenticationApi) {
    // _startListeners();
  }

  // void dispose() {
  //   // _journalDeleteCountroller.close();
  //   // _journalCountroller.close();
  //   throw UnimplementedError();
  // }

  void _startListeners() {
    // Retrieve Firestore Journal Records as List<Journal> not DocumentSnapshot
    // TODO: comeback to this

    // authenticationApi.getFirebaseAuth().currentUser().then((user) {
    //   dbApi.getJournalList(user.uid).listen((journalDocs) {
    //     _addListJournal.add(journalDocs);
    //   });
    //   _journalDeleteCountroller.stream.listen((journal) {
    //     dbApi.deleteJournal(journal);
    //   });
    // });

    throw UnimplementedError();
  }
}

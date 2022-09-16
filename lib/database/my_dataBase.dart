import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/models/PopularResponse.dart';
import 'package:movies_app/screens/watchlist_screen/watchlist_screen.dart';

class MyDB {
  static CollectionReference<Results> getMoviesCollection() {
    return FirebaseFirestore.instance
        .collection(Results.CollectionName)
        .withConverter<Results>(
            fromFirestore: ((snapshot, options) =>
                Results.FromFirestore(snapshot.data()!)),
            toFirestore: ((Results, options) => Results.tofirestor()));
  }

  static Future<void> insertMovie(Results results) {
    CollectionReference<Results> resultsCollection = getMoviesCollection();
    DocumentReference<Results> resultsDoc =
        resultsCollection.doc(results.title);
    results.fireid = resultsDoc.id;
    return resultsDoc.set(results);
  }

  static Future<QuerySnapshot<Results>> getAllMovies() async {
    var querysnapshot = await getMoviesCollection().get();
    return querysnapshot;
  }

  static getMovies() async {
    var querysnapshot = await getMoviesCollection().get();
    var documents = querysnapshot.docs.map((e) => e.data()).toList();
    documents.forEach((element) {
      if (documents.isEmpty) {
        WatchlistScreen.watchlist = [];
      }
      WatchlistScreen.watchlist = documents;
    });
  }

  static Stream<QuerySnapshot<Results>> listenforrealtimeUpdates() {
    return getMoviesCollection().snapshots();
  }

  static Future<void> deletemovie(Results results) {
    DocumentReference<Results> taskdoc =
        getMoviesCollection().doc(results.title);
    return taskdoc.delete();
  }

  static updatemovie(Results results) {
    var taskRef = getMoviesCollection();
    return taskRef
        .doc(results.title)
        .update({'isadded': results.isadded ? false : true});
  }
}

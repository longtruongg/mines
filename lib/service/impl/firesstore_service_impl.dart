import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:mineapss/model/joural.dart';
import 'package:mineapss/service/firesstore_service.dart';

class FireStoreServiceImpl extends FiresStoreService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _collection = "mines";

  FireStoreServiceImpl() {
    _firestore.settings;
  }

  @override
  Stream<List<Journal>> getJouralList(String uId) {
    return _firestore
        .collection(_collection)
        .where('uid', isEqualTo: uId)
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<Journal> _journalDoc =
          querySnapshot.docs.map((e) => Journal.fromDoc(e)).toList();
      _journalDoc.sort((comp1, comp2) => comp2.date.compareTo(comp1.date));
      return _journalDoc;
    });
  }

  @override
  void deleteJoural(Journal journal) async {
    await _firestore
        .collection(_collection)
        .doc(journal.documentID)
        .delete()
        .catchError((onError) => print("On errors :${onError.toString()}"));
  }

  @override
  void updateJouralWithTransection(Journal journal) {}

  @override
  void updateJoural(Journal journal) async {}

  @override
  Future<bool> addJoural(Journal journal) async {
    DocumentReference _docs = await _firestore.collection(_collection).add({
      'date': journal.date,
      'mood': journal.mood,
      'note': journal.note,
      'uid': journal.documentID
    });
    return _docs.id != null;
  }

}

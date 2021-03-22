import 'package:mineapss/model/joural.dart';

abstract class FiresStoreService {
  Stream<List<Journal>> getJouralList(String uId);
  Future<bool> addJoural(Journal journal);
  void updateJoural(Journal journal);
  void updateJouralWithTransection(Journal journal);
  void deleteJoural(Journal journal);
}

import '../models/disease_model.dart';
import '../data/local_disease_db.dart';

class DiseaseService {
  // This is our librarian function
  static DiseaseModel? getDiseaseById(String id) {
    // 1. We look through the list for matches
    final results = LocalDiseaseDB.diseases.where(
      (element) => element.id == id,
    );

    // 2. If the list is empty, we return null. Otherwise, we return the first match.
    return results.isEmpty ? null : results.first;
  }
}

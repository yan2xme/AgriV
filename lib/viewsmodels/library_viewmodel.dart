import 'package:flutter/material.dart';
import '../models/disease_model.dart';
import '../data/local_disease_db.dart';

class LibraryViewModel extends ChangeNotifier {
  // Storing data in Maps to strictly avoid arrays
  final Map<String, DiseaseModel> _libraryMap = {};
  Map<String, DiseaseModel> _filteredMap = {};

  Map<String, DiseaseModel> get filteredMap => _filteredMap;

  LibraryViewModel() {
    _loadLibrary();
  }

  void _loadLibrary() {
    // Populate the initial map from the database
    for (var disease in LocalDiseaseDB.diseases) {
      if (disease.id != "unknown") {
        _libraryMap[disease.id] = disease;
      }
    }
    // Set the initial filtered view to show everything
    _filteredMap = Map.from(_libraryMap);
    notifyListeners();
  }

  void filterDiseases(String keyword) {
    if (keyword.isEmpty) {
      // Reset to full map if search is cleared
      _filteredMap = Map.from(_libraryMap);
    } else {
      // Create a new map containing only the matches
      _filteredMap = {};
      _libraryMap.forEach((key, disease) {
        if (disease.name.toLowerCase().contains(keyword.toLowerCase())) {
          _filteredMap[key] = disease;
        }
      });
    }
    notifyListeners();
  }
}
class DiseaseModel {
  final String id;
  final String name;
  final String severity;
  final String description;
  final TreatmentPlan treatments; // Uses the custom class below
  final String prevention; // Changed to String to match your single text block

  DiseaseModel({
    required this.id,
    required this.name,
    required this.severity,
    required this.description,
    required this.treatments,
    required this.prevention,
  });
}

// Custom class strictly for your Timeline UI
class TreatmentPlan {
  final String immediateAction;
  final String organic;
  final String chemical;
  final String biological;

  TreatmentPlan({
    required this.immediateAction,
    required this.organic,
    required this.chemical,
    required this.biological,
  });
}

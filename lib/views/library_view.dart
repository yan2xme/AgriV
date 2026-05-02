import 'package:flutter/material.dart';
import 'components/disease_card.dart';
import 'diagnostic_result.dart';
import '../data/local_disease_db.dart';
import '../models/disease_model.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({super.key});

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  // 1. Create a list to hold the diseases we want to show
  List<DiseaseModel> filteredDiseases = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  @override
  void initState() {
    super.initState(); // <-- Change this line!
    // 2. Start with the full list of 33 diseases
    filteredDiseases = LocalDiseaseDB.diseases;
  }

  // 3. Logic to filter the list based on user input
  void _runFilter(String enteredKeyword) {
    List<DiseaseModel> results = [];
    if (enteredKeyword.isEmpty) {
      // If the search field is empty, show all diseases
      results = LocalDiseaseDB.diseases;
    } else {
      // Filter by name (case-insensitive)
      results = LocalDiseaseDB.diseases
          .where((disease) =>
          disease.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Update the UI
    setState(() {
      filteredDiseases = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xFFF0F0F0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/views/assets/logo.png',
              fit: BoxFit.contain,
              height: 32,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              // Neo-Brutalist Tip: You could swap this for a solid 2px border!
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextField(
              controller: _searchController,
              onChanged: (value) => _runFilter(value), // Trigger filtering
              decoration: InputDecoration(
                hintText: 'Search diseases...',
                hintStyle: TextStyle(color: Colors.grey.shade400),
                prefixIcon: const Icon(Icons.search, color: Colors.green),
                // Clear button to quickly reset search
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _runFilter('');
                  },
                )
                    : null,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
            ),
          ),

          // 4. Use Expanded to allow the list to take up remaining space
          Expanded(
            child: filteredDiseases.isNotEmpty
                ? ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: filteredDiseases.length,
              itemBuilder: (context, index) {
                final disease = filteredDiseases[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DiagnosticResult(
                          isFromScanner: false,
                          disease: disease,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      DiseaseCard(
                        name: disease.name,
                        description: disease.description,
                        severity: disease.severity,
                        layoutType: CardType.diseaseLibrary,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              },
            )
                : const Center(
              child: Text(
                'No diseases found matching your search.',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
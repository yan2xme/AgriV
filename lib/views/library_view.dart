import 'package:flutter/material.dart';
import 'components/disease_card.dart';
import 'diagnostic_result.dart';
import '../viewsmodels/library_viewmodel.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({super.key});

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  final LibraryViewModel _viewModel = LibraryViewModel();
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  // ==========================================
  // Neo-Brutalist "About" Pop-up Dialog
  // ==========================================
  void _showAboutDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: Color(0xFF4F6F52), width: 2), // Neo-brutalist border
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Header with X Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'About',
                          style: TextStyle(
                            fontFamily: 'Space Grotesk',
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF4F6F52),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Color(0xFF4F6F52)),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    const Divider(color: Color(0xFF4F6F52)),
                    const SizedBox(height: 10),

                    // Made with Love Section
                    const Icon(Icons.favorite, color: Color(0xFFCC0000), size: 28),
                    const SizedBox(height: 8),
                    const Text(
                      'Made with Love',
                      style: TextStyle(
                          fontFamily: 'Space Grotesk',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4F6F52)
                      ),
                    ),
                    const Text(
                      'AgriVysor 2026',
                      style: TextStyle(
                          fontFamily: 'Space Grotesk',
                          fontSize: 14,
                          color: Colors.grey
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Organization Section
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFCBFFDD),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'For 4-H Sarangani',
                        style: TextStyle(
                            fontFamily: 'Space Grotesk',
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF4F6F52)
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    // Team Members
                    _buildTeamMember('Kristina Pearl Makalwa', 'Project Adviser'),
                    _buildTeamMember('Marc Joseph Mian', 'Researcher'),
                    _buildTeamMember('Robert Stephen Labuan', 'Researcher'),
                    _buildTeamMember('Skye Adrielle Lapot', 'Researcher'),
                    _buildTeamMember('Klent Czarwen Tangaro', 'UI/UX Designer and Developer'),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  // Helper widget to keep the team list clean
  Widget _buildTeamMember(String name, String role) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        children: [
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: 'Space Grotesk',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87
            ),
          ),
          Text(
            role,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: 'Space Grotesk',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xFFF0F0F0),
        elevation: 0,
        // Centered properly
        centerTitle: true,
        title: Image.asset(
          'lib/views/assets/logo.png',
          fit: BoxFit.contain,
          height: 32,
        ),
        // Added the Info Icon!
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Color(0xFF4F6F52), size: 28),
            onPressed: () => _showAboutDialog(context),
          ),
          const SizedBox(width: 8), // Small padding from the edge
        ],
      ),
      body: Column(
        children: [
          // Neo-Brutalist Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF4F6F52), width: 2),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFF4F6F52),
                    offset: Offset(4, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _viewModel.filterDiseases,
                decoration: InputDecoration(
                  hintText: 'Search diseases...',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontFamily: 'Space Grotesk',
                  ),
                  prefixIcon: const Icon(Icons.search, color: Color(0xFF4F6F52)),
                  suffixIcon: ListenableBuilder(
                    listenable: _searchController,
                    builder: (context, child) {
                      return _searchController.text.isNotEmpty
                          ? IconButton(
                        icon: const Icon(Icons.clear, color: Color(0xFF4F6F52)),
                        onPressed: () {
                          _searchController.clear();
                          _viewModel.filterDiseases('');
                        },
                      )
                          : const SizedBox.shrink();
                    },
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
              ),
            ),
          ),

          // Dynamic List relying on ListenableBuilder and Iterables
          Expanded(
            child: ListenableBuilder(
              listenable: _viewModel,
              builder: (context, child) {
                final diseasesIterable = _viewModel.filteredMap.values;

                if (diseasesIterable.isEmpty) {
                  return const Center(
                    child: Text(
                      'No diseases found matching your search.',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: diseasesIterable.length,
                  itemBuilder: (context, index) {
                    final disease = diseasesIterable.elementAt(index);

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DiagnosticResult(
                              isFromScanner: false,
                              disease: disease,
                              imagePath: 'lib/views/assets/diseases/${disease.id}.jpg',
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: DiseaseCard(
                          layoutType: CardType.diseaseLibrary,
                          name: disease.name,
                          description: disease.description,
                          severity: disease.severity,
                          imagePath: 'lib/views/assets/diseases/${disease.id}.jpg',
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
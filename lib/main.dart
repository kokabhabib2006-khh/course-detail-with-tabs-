import 'package:flutter/material.dart';

void main() {
  runApp(const CampusLostAndFoundApp());
}

class CampusLostAndFoundApp extends StatelessWidget {
  const CampusLostAndFoundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Lost & Found',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const LostAndFoundHomeScreen(),
    );
  }
}

// 1. Data Model for Lost & Found Items
class LostFoundItem {
  final String id;
  final String name;
  final String location;
  final String status; // 'Lost' or 'Found'
  final String date;
  final String description;
  final String contactInfo;

  const LostFoundItem({
    required this.id,
    required this.name,
    required this.location,
    required this.status,
    required this.date,
    required this.description,
    required this.contactInfo,
  });
}

// 2. Sample Data (At least 8 items as required)
final List<LostFoundItem> campusItems = [
  const LostFoundItem(
    id: '1',
    name: 'Blue Hydro Flask Water Bottle',
    location: 'Main Library - 2nd Floor',
    status: 'Found',
    date: 'Oct 28, 2026',
    description: '32oz insulated blue water bottle with a few programming stickers on the side. Left near the quiet study desks.',
    contactInfo: 'Library Front Desk (Ext. 402)',
  ),
  const LostFoundItem(
    id: '2',
    name: 'Casio Scientific Calculator (fx-991EX)',
    location: 'Computer Lab 3 - CS Block',
    status: 'Lost',
    date: 'Oct 28, 2026',
    description: 'Black Casio ClassWiz calculator. Has initials "A.K." scratched lightly on the back cover.',
    contactInfo: 'ali.khan@students.au.edu.pk',
  ),
  const LostFoundItem(
    id: '3',
    name: 'Apple AirPods Pro (2nd Gen)',
    location: 'Main Cafeteria',
    status: 'Found',
    date: 'Oct 27, 2026',
    description: 'White charging case found on a corner table near the coffee counter.',
    contactInfo: 'Student Affairs Office - Room 104',
  ),
  const LostFoundItem(
    id: '4',
    name: 'Black Dell Laptop Charger (65W)',
    location: 'Auditorium Hall B',
    status: 'Found',
    date: 'Oct 27, 2026',
    description: 'Standard USB-C Dell laptop power adapter left plugged into the wall socket near row G.',
    contactInfo: 'Admin Security Desk',
  ),
  const LostFoundItem(
    id: '5',
    name: 'Student ID Card - BSSE 5th Sem',
    location: 'Sports Complex / Cricket Ground',
    status: 'Found',
    date: 'Oct 26, 2026',
    description: 'University student ID card belonging to Muhammad Usman.',
    contactInfo: 'Main Gate Security Office',
  ),
  const LostFoundItem(
    id: '6',
    name: 'Grey Nike Hoodie (Size L)',
    location: 'Engineering Block - Room 205',
    status: 'Lost',
    date: 'Oct 26, 2026',
    description: 'Light grey pullover hoodie left on the back of a chair after the afternoon lecture.',
    contactInfo: '0300-1234567',
  ),
  const LostFoundItem(
    id: '7',
    name: 'SanDisk 64GB USB Flash Drive',
    location: 'Digital Library',
    status: 'Lost',
    date: 'Oct 25, 2026',
    description: 'Black and red slider USB drive containing Mobile App Development project files.',
    contactInfo: 'sara.ahmed@students.au.edu.pk',
  ),
  const LostFoundItem(
    id: '8',
    name: 'Silver Ray-Ban Prescription Glasses',
    location: 'Bus Stop / Parking Area A',
    status: 'Found',
    date: 'Oct 25, 2026',
    description: 'Thin metal frame glasses inside a hard brown leather case.',
    contactInfo: 'Transport Office',
  ),
  const LostFoundItem(
    id: '9',
    name: 'Spiral Notebook - Software Engineering',
    location: 'Mosque Courtyard',
    status: 'Found',
    date: 'Oct 24, 2026',
    description: 'Blue cover spiral notebook with handwritten lecture notes for SE323.',
    contactInfo: 'CS Department Clerk Office',
  ),
];

// 3. Home Screen displaying the list using ListView.builder
class LostAndFoundHomeScreen extends StatelessWidget {
  const LostAndFoundHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Lost & Found'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: campusItems.length,
        itemBuilder: (context, index) {
          final item = campusItems[index];
          final isLost = item.status == 'Lost';

          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row: Item Name & Status Badge
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: isLost
                              ? Colors.red.shade100
                              : Colors.green.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          item.status.toUpperCase(),
                          style: TextStyle(
                            color: isLost
                                ? Colors.red.shade900
                                : Colors.green.shade900,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Location Row
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 18,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          item.location,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Action Button to View Details
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Navigation to Item Details Screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ItemDetailsScreen(item: item),
                          ),
                        );
                      },
                      icon: const Icon(Icons.visibility, size: 18),
                      label: const Text('View Details'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// 4. Item Details Screen
class ItemDetailsScreen extends StatelessWidget {
  final LostFoundItem item;

  const ItemDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final isLost = item.status == 'Lost';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isLost ? Colors.red.shade50 : Colors.green.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isLost ? Colors.red.shade300 : Colors.green.shade300,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    isLost ? Icons.search_off : Icons.check_circle_outline,
                    color: isLost ? Colors.red.shade700 : Colors.green.shade700,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Status: ${item.status}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color:
                      isLost ? Colors.red.shade900 : Colors.green.shade900,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Item Title
            Text(
              item.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(height: 30),

            // Details List
            _buildDetailRow(Icons.location_on, 'Campus Location', item.location),
            const SizedBox(height: 16),
            _buildDetailRow(Icons.calendar_today, 'Date Reported', item.date),
            const SizedBox(height: 16),
            _buildDetailRow(Icons.contact_phone, 'Contact / Claim At', item.contactInfo),
            const Divider(height: 30),

            // Description Section
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              item.description,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 32),

            // Back Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back to All Items'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.indigo, size: 22),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
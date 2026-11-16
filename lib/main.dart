import 'package:flutter/material.dart';

void main() {
  runApp(const CourseApp());
}

class CourseApp extends StatelessWidget {
  const CourseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course Details',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF3F4FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF3949AB),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const CourseDetailsScreen(),
    );
  }
}

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({super.key});

  final List<String> topics = const [
    'Introduction to Programming',
    'Programming Fundamentals',
    'Variables and Data Types',
    'Conditional Statements',
    'Loops and Iterations',
    'Functions and Methods',
    'Arrays and Lists',
    'Object-Oriented Programming',
    'Classes and Objects',
    'Final Project and Revision',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Course — 264',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            isScrollable: false,
            indicatorColor: Colors.amber,
            indicatorWeight: 4,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(
                icon: Icon(Icons.info_outline),
                text: 'Overview',
              ),
              Tab(
                icon: Icon(Icons.menu_book),
                text: 'Syllabus',
              ),
              Tab(
                icon: Icon(Icons.star_outline),
                text: 'Reviews',
              ),
            ],
          ),
        ),

        body: TabBarView(
          children: [

            // TAB 1: OVERVIEW
            ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF3949AB),
                        Color(0xFF7986CB),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.school,
                        color: Colors.white,
                        size: 45,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Mobile Application Development',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Learn to build modern mobile applications using Flutter and Dart.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Course Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF303F9F),
                  ),
                ),

                const SizedBox(height: 10),

                Card(
                  elevation: 3,
                  child: Column(
                    children: const [
                      ListTile(
                        leading: Icon(
                          Icons.book,
                          color: Colors.indigo,
                        ),
                        title: Text('Course Name'),
                        subtitle: Text(
                          'Mobile Application Development',
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(
                          Icons.access_time,
                          color: Colors.indigo,
                        ),
                        title: Text('Credit Hours'),
                        subtitle: Text('3 Credit Hours'),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(
                          Icons.person,
                          color: Colors.indigo,
                        ),
                        title: Text('Instructor'),
                        subtitle: Text('Ms. Ayesha Khan'),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // TAB 2: SYLLABUS
            ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text(
                  'Course Syllabus',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF303F9F),
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Weekly topics covered in this course.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 12),

                ...List.generate(
                  topics.length,
                      (index) => Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(
                      vertical: 6,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.indigo,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        'Week ${index + 1}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                      subtitle: Text(topics[index]),
                      trailing: const Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // TAB 3: REVIEWS
            ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text(
                  'Student Reviews',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF303F9F),
                  ),
                ),

                const SizedBox(height: 12),

                Card(
                  elevation: 3,
                  child: const ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.indigo,
                      child: Text(
                        'A',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      'Ali Ahmed',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Very helpful course. I learned Flutter easily.',
                    ),
                    trailing: Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                ),

                Card(
                  elevation: 3,
                  child: const ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple,
                      child: Text(
                        'S',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      'Sara Khan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'The lectures are interesting and easy to understand.',
                    ),
                    trailing: Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                ),

                Card(
                  elevation: 3,
                  child: const ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.teal,
                      child: Text(
                        'U',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      'Usman Ali',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Excellent course with practical examples.',
                    ),
                    trailing: Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
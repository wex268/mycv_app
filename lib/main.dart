import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyCVApp());
}

// APP COLORS
const navyBlue = Color(0xFF142D4E);
const armyGreen = Color(0xFF4B6344);
const lightGreen = Color(0xFFE8EFE5);
const backgroundColor = Color(0xFFF4F6F8);

class MyCVApp extends StatelessWidget {
  const MyCVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Professional CV',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: navyBlue,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: armyGreen,
          primary: navyBlue,
          secondary: armyGreen,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: navyBlue,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// MAIN SCREEN
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    ProfilePage(),
    SkillsPage(),
    ExperiencePage(),
    EducationPage(),
    ContactPage(),
  ];

  final List<String> titles = [
    'My Profile',
    'My Skills',
    'My Experience',
    'My Education',
    'Contact Me',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titles[selectedIndex],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: navyBlue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        selectedFontSize: 11,
        unselectedFontSize: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            label: 'Skills',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Experience',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Education',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}

// SECTION TITLE
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
          color: navyBlue,
        ),
      ),
    );
  }
}

// REUSABLE CARD
class CVCard extends StatelessWidget {
  final Widget child;

  const CVCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: child,
      ),
    );
  }
}

// PROFILE PAGE
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  color: navyBlue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 65,
                      backgroundColor: armyGreen,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(
                          'assets/images/profile.jpg',
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    const Text(
                      'BAPHIWE DLAMINI',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Aspiring Software Developer',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: armyGreen,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Text(
                        'BSc Information Technology Student',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionTitle(
                      title: 'About Me',
                    ),

                    const CVCard(
                      child: Text(
                        'I am a passionate Information Technology '
                            'student who enjoys developing software '
                            'applications and learning new technologies. '
                            'My interests include mobile application '
                            'development, web development, networking, '
                            'and database management. '
                            'I am motivated to improve my technical '
                            'skills and create innovative solutions.',
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.7,
                        ),
                      ),
                    ),

                    const SectionTitle(
                      title: 'Career Objective',
                    ),

                    const CVCard(
                      child: Text(
                        'To become a skilled software developer '
                            'and contribute to the development of '
                            'modern technology solutions that improve '
                            'people’s everyday lives.',
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.7,
                        ),
                      ),
                    ),

                    const SectionTitle(
                      title: 'My Interests',
                    ),

                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: const [
                        Chip(
                          label: Text('Mobile Apps'),
                        ),
                        Chip(
                          label: Text('Web Development'),
                        ),
                        Chip(
                          label: Text('Technology'),
                        ),
                        Chip(
                          label: Text('Networking'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// SKILLS PAGE
class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  Widget skillItem(String name, double value) {
    return CVCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: navyBlue,
                ),
              ),

              Text(
                '${(value * 100).toInt()}%',
                style: const TextStyle(
                  color: armyGreen,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          LinearProgressIndicator(
            value: value,
            minHeight: 9,
            backgroundColor: lightGreen,
            color: armyGreen,
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SectionTitle(
              title: 'Technical Skills',
            ),

            skillItem('HTML & CSS', 0.85),
            skillItem('JavaScript', 0.75),
            skillItem('C++ Programming', 0.80),
            skillItem('Flutter & Dart', 0.70),
            skillItem('Database Management', 0.75),
            skillItem('Computer Networking', 0.70),
            skillItem('Linux Operating System', 0.65),

            const SizedBox(height: 15),

            const SectionTitle(
              title: 'Soft Skills',
            ),

            const CVCard(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  Chip(
                    backgroundColor: lightGreen,
                    label: Text('Teamwork'),
                  ),
                  Chip(
                    backgroundColor: lightGreen,
                    label: Text('Problem Solving'),
                  ),
                  Chip(
                    backgroundColor: lightGreen,
                    label: Text('Communication'),
                  ),
                  Chip(
                    backgroundColor: lightGreen,
                    label: Text('Creativity'),
                  ),
                  Chip(
                    backgroundColor: lightGreen,
                    label: Text('Time Management'),
                  ),
                  Chip(
                    backgroundColor: lightGreen,
                    label: Text('Adaptability'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// EXPERIENCE PAGE
class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  Widget projectCard(
      String title,
      String technology,
      String description,
      IconData icon,
      ) {
    return CVCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: lightGreen,
                child: Icon(
                  icon,
                  color: armyGreen,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: navyBlue,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            technology,
            style: const TextStyle(
              color: armyGreen,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SectionTitle(
              title: 'Academic Projects',
            ),

            projectCard(
              'CareLink Mobile Application',
              'Flutter & Dart',
              'A mobile application project focused on '
                  'presenting health-related information '
                  'through a simple and user-friendly interface.',
              Icons.health_and_safety,
            ),

            projectCard(
              'Student Management System',
              'C++ Programming',
              'An academic programming project that '
                  'demonstrates data management, user input, '
                  'and basic programming concepts.',
              Icons.computer,
            ),

            projectCard(
              'Network Configuration',
              'Cisco Packet Tracer',
              'Practical networking exercises involving '
                  'router configuration, IP addressing, '
                  'and network connectivity testing.',
              Icons.router,
            ),

            const SizedBox(height: 15),

            const SectionTitle(
              title: 'Professional Development',
            ),

            const CVCard(
              child: Text(
                'Currently developing practical experience '
                    'through university assignments, '
                    'programming exercises, and independent '
                    'technology projects.',
                style: TextStyle(
                  fontSize: 15,
                  height: 1.7,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// EDUCATION PAGE
class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SectionTitle(
              title: 'Academic Background',
            ),

            const CVCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.school,
                        size: 35,
                        color: armyGreen,
                      ),

                      SizedBox(width: 12),

                      Expanded(
                        child: Text(
                          'Limkokwing University',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: navyBlue,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15),

                  Text(
                    'Bachelor of Science in Information Technology',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    'Status: Currently Studying',
                    style: TextStyle(
                      color: armyGreen,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    'Location: Eswatini',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            const SectionTitle(
              title: 'Relevant Coursework',
            ),

            const CVCard(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.code,
                      color: armyGreen,
                    ),
                    title: Text('Programming'),
                  ),

                  Divider(),

                  ListTile(
                    leading: Icon(
                      Icons.web,
                      color: armyGreen,
                    ),
                    title: Text('Web Design'),
                  ),

                  Divider(),

                  ListTile(
                    leading: Icon(
                      Icons.storage,
                      color: armyGreen,
                    ),
                    title: Text('Database Systems'),
                  ),

                  Divider(),

                  ListTile(
                    leading: Icon(
                      Icons.memory,
                      color: armyGreen,
                    ),
                    title: Text('Operating Systems'),
                  ),

                  Divider(),

                  ListTile(
                    leading: Icon(
                      Icons.router,
                      color: armyGreen,
                    ),
                    title: Text('Computer Networking'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            const SectionTitle(
              title: 'Certifications',
            ),

            const CVCard(
              child: ListTile(
                leading: Icon(
                  Icons.workspace_premium,
                  color: armyGreen,
                ),
                title: Text(
                  'Professional Certifications',
                ),
                subtitle: Text(
                  'Add completed certifications here.',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// CONTACT PAGE
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  Future<void> openLink(
      BuildContext context,
      String link,
      ) async {
    final Uri url = Uri.parse(link);

    try {
      final bool opened = await launchUrl(
        url,
        mode: LaunchMode.platformDefault,
      );

      if (!opened && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Unable to open this link',
            ),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Unable to open this link',
            ),
          ),
        );
      }
    }
  }

  Widget contactCard(
      BuildContext context,
      IconData icon,
      String title,
      String subtitle,
      String link,
      ) {
    return CVCard(
      child: ListTile(
        contentPadding: EdgeInsets.zero,

        leading: CircleAvatar(
          backgroundColor: lightGreen,
          child: Icon(
            icon,
            color: armyGreen,
          ),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: navyBlue,
          ),
        ),

        subtitle: Text(subtitle),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: armyGreen,
        ),

        onTap: () {
          openLink(context, link);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Center(
              child: CircleAvatar(
                radius: 45,
                backgroundColor: lightGreen,
                child: Icon(
                  Icons.contact_mail,
                  size: 45,
                  color: armyGreen,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                'Get In Touch',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: navyBlue,
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Center(
              child: Text(
                'Feel free to contact me for collaboration, '
                    'projects, or professional opportunities.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 25),

            contactCard(
              context,
              Icons.email,
              'Email Address',
              'baphiwedlamini@gmail.com',
              'mailto:baphiwedlamini@gmail.com',
            ),

            contactCard(
              context,
              Icons.phone,
              'Phone Number',
              '+268 79266182',
              'tel:+268 76842422',
            ),

            contactCard(
              context,
              Icons.code,
              'GitHub',
              'View My Projects',
              'https://github.com/',
            ),

            contactCard(
              context,
              Icons.business,
              'LinkedIn',
              'Professional Profile',
              'https://www.linkedin.com/',
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                '© 2026 Baphiwe Dlamini',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
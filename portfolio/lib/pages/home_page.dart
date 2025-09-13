import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final _scrollController = ScrollController();
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _contactKey = GlobalKey();

  bool _isDarkMode = true;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = _isDarkMode ? Colors.black : Colors.white;
    final appBarTextColor = _isDarkMode ? Colors.white : Colors.black;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: Text(
          'Alban Jaures',
          style: GoogleFonts.readexPro(
            textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: appBarTextColor,
            ),
          ),
        ),
        actions: [
          _navButton('About', _aboutKey),
          _navButton('Skills', _skillsKey),
          _navButton('Projects', _projectsKey),
          _navButton('Contact', _contactKey),
          IconButton(
            icon: Icon(
              _isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
              color: appBarTextColor,
            ),
            tooltip: 'Toggle Theme',
            onPressed: _toggleTheme,
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildHeaderSection(),
            _buildAboutMeSection(key: _aboutKey),
            _buildSkillsSection(key: _skillsKey),
            _buildProjectsSection(key: _projectsKey),
            _buildContactSection(key: _contactKey),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _navButton(String title, GlobalKey key) {
    return TextButton(
      onPressed: () => _scrollTo(key),
      child: Text(
        title,
        style: GoogleFonts.readexPro(
          textStyle: TextStyle(
            fontSize: 15,
            color: Colors.deepPurpleAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    final headerBgColor = _isDarkMode
        ? const Color.fromARGB(255, 23, 2, 27).withValues()
        : Colors.white.withValues();
    final nameTextColor = _isDarkMode
        ? Colors.deepPurple
        : Colors.deepPurpleAccent;
    final subtitleTextColor = _isDarkMode ? Colors.white70 : Colors.black87;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 40.0),
          decoration: BoxDecoration(color: headerBgColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                  'https://media.licdn.com/dms/image/v2/D4D03AQECakVbwbwDug/profile-displayphoto-shrink_200_200/B4DZS7f0H8GcAY-/0/1738312468750?e=1760572800&v=beta&t=-YOX03kIQSdg638D1FKtTNKmxA6D2Njq8RkpSQmJvco',
                ), // Placeholder for profile image
              ),
              SizedBox(height: 20),
              Text(
                'Alban Jaures',
                style: GoogleFonts.readexPro(
                  textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: nameTextColor,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  Text(
                    'Software Engineer & Mobile App Developer',
                    style: GoogleFonts.alata(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: subtitleTextColor,
                      ),
                    ),
                  ),
                  Text(
                    'Certified Backend Developer',
                    style: GoogleFonts.alata(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: subtitleTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutMeSection({required GlobalKey key}) {
    final titleColor = _isDarkMode
        ? Colors.deepPurpleAccent
        : Colors.deepPurple;
    final textColor = _isDarkMode ? Colors.white : Colors.black87;
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: GoogleFonts.readexPro(
              textStyle: TextStyle(
                fontSize: 36,
                color: titleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Software developer passionate about new technologies. I am specialize in building robust and scalable applications as a full-stack software engineer. My expertise lies in backend development using Python and Node.js, where I design and implement APIs, manage databases, and ensure system performance.  On the frontend, I use Flutter to create beautiful and responsive user interfaces that deliver a seamless experience across multiple platforms.',
            style: GoogleFonts.aleo(
              textStyle: TextStyle(fontSize: 18, color: textColor, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection({required GlobalKey key}) {
    final skills = [
      'Flutter',
      'Dart',
      'Mobile Development',
      'Node.js',
      'Python',
      'C',
      'Firebase',
      'MongoDB',
      'REST APIs',
      'SQL',
      'GitHub',
      'Agile Methodologies',
      'NoSQL',
    ];
    final skillsBgColor = _isDarkMode
        ? const Color.fromARGB(255, 23, 2, 27).withValues()
        : Colors.white.withValues();
    final titleColor = _isDarkMode
        ? Colors.deepPurpleAccent
        : Colors.deepPurple;
    return Container(
      key: key,
      width: double.infinity,
      color: skillsBgColor,
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: GoogleFonts.readexPro(
              textStyle: TextStyle(
                fontSize: 36,
                color: titleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: skills.map((skill) => _buildSkillTag(skill)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillTag(String skill) {
    final chipBgColor = _isDarkMode
        ? Colors.blue.shade100
        : Colors.blue.shade700;
    final chipTextColor = _isDarkMode ? Colors.black : Colors.black;
    return Chip(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      label: Text(skill),
      backgroundColor: chipBgColor,
      labelStyle: TextStyle(color: chipTextColor, fontWeight: FontWeight.bold),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }

  Widget _buildProjectsSection({required GlobalKey key}) {
    final projects = [
      {
        'name': 'Simple Shell',
        'description':
            ' A minimalist UNIX command language interpreter build in C language designed to read and execute commands from both files and standard input.',
        'link': 'https://github.com/DTAJ095/simple_shell',
      },
      {
        'name': 'Personal Financial Tracker',
        'description':
            ' A mobile application build with Flutter for the frontend and Django for the backend designed to help user to track their different expenses.',
        'image': 'assets/images/1.png',
        'link': 'https://github.com/Romeo509/Personal_Financial_Tracker',
      },
      {
        'name': 'Portfolio Website',
        'description':
            'This very website, showcasing skills and projects. Built with Flutter!',
        ''
                'link':
            'https://github.com/DTAJ095/portfolio',
      },
    ];

    final titleColor = _isDarkMode
        ? Colors.deepPurpleAccent
        : Colors.deepPurple;
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: GoogleFonts.readexPro(
              textStyle: TextStyle(
                fontSize: 36,
                color: titleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, // Change to 2 or 3 for a desktop layout
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              childAspectRatio: 3.5,
            ),
            itemBuilder: (context, index) {
              return _buildProjectCard(projects[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(Map<String, String> project) {
    final cardTextColor = _isDarkMode ? Colors.white : Colors.black87;
    final cardDescColor = _isDarkMode ? Colors.white70 : Colors.black54;
    final cardBgColor = _isDarkMode
        ? Colors.deepPurple.shade900
        : Colors.blue.shade100;
    return Card(
      elevation: 4,
      color: cardBgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project['name']!,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: cardTextColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              project['description']!,
              style: GoogleFonts.aleo(
                textStyle: TextStyle(fontSize: 16, color: cardDescColor),
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () => _launchURL(project['link']!),
              child: Text(
                'View on GitHub',
                style: GoogleFonts.aleo(
                  textStyle: TextStyle(fontSize: 14, color: cardDescColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      // You can show a SnackBar or an alert dialog here
      print('Could not launch $url');
    }
  }

  Widget _buildContactSection({required GlobalKey key}) {
    final contactBgColor = _isDarkMode
        ? const Color.fromARGB(255, 23, 2, 27).withValues()
        : Colors.white.withValues();
    final titleColor = _isDarkMode
        ? Colors.deepPurpleAccent
        : Colors.deepPurple;
    final textColor = _isDarkMode ? Colors.white70 : Colors.black87;
    final iconColor = _isDarkMode ? Colors.white : Colors.deepPurple;
    return Container(
      key: key,
      width: double.infinity,
      color: contactBgColor,
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Contact Me',
            style: GoogleFonts.readexPro(
              textStyle: TextStyle(
                fontSize: 36,
                color: titleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Feel free to get in touch! I am always open to discussing new projects, creative ideas, or opportunities to be part of your visions.',
            style: GoogleFonts.aleo(
              textStyle: TextStyle(fontSize: 16, color: textColor, height: 1.5),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.google,
                  color: iconColor,
                  size: 36,
                ),
                onPressed: () => _launchURL('mailto:albanjaures26@gmail.com'),
              ),
              const SizedBox(width: 20),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.linkedin,
                  color: iconColor,
                  size: 36,
                ),
                onPressed: () =>
                    _launchURL('https://www.linkedin.com/in/alban-jaures'),
              ),
              const SizedBox(width: 20),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.github,
                  color: iconColor,
                  size: 36,
                ),
                onPressed: () => _launchURL('https://github.com/DTAJ095'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    final footerBgColor = _isDarkMode
        ? Colors.blue.shade800
        : Colors.blue.shade200;
    final footerTextColor = _isDarkMode ? Colors.white54 : Colors.black54;
    return Container(
      width: double.infinity,
      color: footerBgColor,
      padding: const EdgeInsets.all(20.0),
      child: Text(
        '© 2025 Alban Jaures. All Rights Reserved.',
        style: TextStyle(color: footerTextColor, fontSize: 14),
        textAlign: TextAlign.center,
      ),
    );
  }
}

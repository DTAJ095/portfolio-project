import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/widgets/on_hover_button.dart';
import 'package:portfolio/widgets/on_hover_container.dart';
import 'package:portfolio/widgets/on_hover_text.dart';
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

  //Handle theme toggle
  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  // Scroll to section
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        return Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            backgroundColor: bgColor,
            elevation: 0,
            title: Text(
              'Alban Jaures',
              style: GoogleFonts.readexPro(
                textStyle: TextStyle(
                  fontSize: screenWidth < 600 ? 22 : 30,
                  fontWeight: FontWeight.bold,
                  color: appBarTextColor,
                ),
              ),
            ),
            actions: [
              _navButton('About', _aboutKey, screenWidth),
              _navButton('Skills', _skillsKey, screenWidth),
              _navButton('Projects', _projectsKey, screenWidth),
              _navButton('Contact', _contactKey, screenWidth),
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
                _buildHeaderSection(screenWidth),
                _buildAboutMeSection(key: _aboutKey, screenWidth: screenWidth),
                _buildSkillsSection(key: _skillsKey, screenWidth: screenWidth),
                _buildProjectsSection(
                  key: _projectsKey,
                  screenWidth: screenWidth,
                ),
                _buildContactSection(
                  key: _contactKey,
                  screenWidth: screenWidth,
                ),
                _buildFooter(screenWidth),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _navButton(String title, GlobalKey key, double screenWidth) {
    return TextButton(
      onPressed: () => _scrollTo(key),
      child: OnHoverText(
        builder: (bool isHovered) {
          final color = isHovered
              ? Colors.amberAccent
              : Colors.deepPurpleAccent;
          return Text(
            title,
            style: GoogleFonts.readexPro(
              textStyle: TextStyle(
                fontSize: screenWidth < 600 ? 13 : 15,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeaderSection(double screenWidth) {
    final headerBgColor = _isDarkMode
        ? Colors.deepPurple.shade900.withValues()
        : Colors.blue.shade100.withValues();
    final nameTextColor = _isDarkMode ? Colors.white70 : Colors.black;
    final subtitleTextColor = _isDarkMode ? Colors.white70 : Colors.black87;
    final isMobile = screenWidth < 600;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: isMobile ? 300 : 450,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 40.0 : 80.0,
            horizontal: isMobile ? 16.0 : 40.0,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                headerBgColor,
                const Color.fromARGB(255, 26, 11, 66).withAlpha(100),
              ],
            ),
          ),
          child: isMobile
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assests/mypic.jpg'),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Alban Jaures',
                        style: GoogleFonts.readexPro(
                          textStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: nameTextColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Software Engineer & Mobile App Developer',
                        style: GoogleFonts.alata(
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: subtitleTextColor,
                          ),
                        ),
                      ),
                      Text(
                        'Certified Backend Developer',
                        style: GoogleFonts.alata(
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: subtitleTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/mypic.jpg'),
                    ),
                    SizedBox(width: 40),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                          Text(
                            'Software Engineer & Flutter Developer',
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
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildAboutMeSection({
    required GlobalKey key,
    required double screenWidth,
  }) {
    final titleColor = _isDarkMode
        ? Colors.deepPurpleAccent
        : Colors.deepPurple;
    final textColor = _isDarkMode ? Colors.white : Colors.black87;
    final isMobile = screenWidth < 600;
    return Padding(
      key: key,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 30.0 : 60.0,
        horizontal: isMobile ? 16.0 : 40.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: GoogleFonts.readexPro(
              textStyle: TextStyle(
                fontSize: isMobile ? 24 : 36,
                color: titleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 10 : 20),
          Text(
            'Software developer passionate about new technologies. I am specialize in building robust and scalable applications as a full-stack software engineer. My expertise lies in backend development using Python and Node.js, where I design and implement APIs, manage databases, and ensure system performance.  On the frontend, I use Flutter to create beautiful and responsive user interfaces that deliver a seamless experience across multiple platforms.',
            style: GoogleFonts.aleo(
              textStyle: TextStyle(
                fontSize: isMobile ? 14 : 18,
                color: textColor,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection({
    required GlobalKey key,
    required double screenWidth,
  }) {
    final skills = [
      'Flutter',
      'Dart',
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
      'Bash',
    ];
    final skillsBgColor = _isDarkMode
        ? Colors.deepPurple.shade900.withValues()
        : Colors.blue.shade100.withValues();
    final titleColor = _isDarkMode
        ? Colors.deepPurpleAccent
        : Colors.deepPurple;
    final isMobile = screenWidth < 600;
    return Container(
      key: key,
      width: double.infinity,
      color: skillsBgColor,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 30.0 : 60.0,
        horizontal: isMobile ? 16.0 : 40.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: GoogleFonts.readexPro(
              textStyle: TextStyle(
                fontSize: isMobile ? 24 : 36,
                color: titleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 10 : 20),
          Wrap(
            spacing: isMobile ? 6.0 : 10.0,
            runSpacing: isMobile ? 6.0 : 10.0,
            children: skills
                .map((skill) => _buildSkillTag(skill, isMobile))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillTag(String skill, bool isMobile) {
    final chipBgColor = _isDarkMode
        ? Colors.blue.shade100
        : Colors.blue.shade700;
    final chipTextColor = _isDarkMode ? Colors.black : Colors.white;
    return Chip(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      label: Text(skill),
      backgroundColor: chipBgColor,
      labelStyle: TextStyle(
        color: chipTextColor,
        fontWeight: FontWeight.bold,
        fontSize: isMobile ? 12 : 14,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 8 : 12,
        vertical: isMobile ? 6 : 8,
      ),
    );
  }

  Widget _buildProjectsSection({
    required GlobalKey key,
    required double screenWidth,
  }) {
    final projects = [
      {
        'name': 'Simple Shell',
        'description':
            'A minimalist UNIX command language interpreter build in C language designed to read and execute commands from both files and standard input.',
        'link': 'https://github.com/DTAJ095/simple_shell',
      },
      {
        'name': 'Personal Financial Tracker',
        'description':
            'A mobile application build with Flutter for the frontend and Django for the backend designed to help user to track their different expenses.',
        'image': 'assets/images/1.png',
        'link': 'https://github.com/Romeo509/Personal_Financial_Tracker',
      },
      {
        'name': 'AfricaStay',
        'description':
            "AfricaStay is a travel booking platform designed specifically for exploring and booking accommodations, flights, and other travel services across Africa.",
        'link': 'https://github.com/DTAJ095/mvp_repo/tree/main/AfricaStay',
      },
      {
        'name': 'Portfolio Website',
        'description':
            'This is the website showcasing skills and projects. Built with Flutter!',
        'link': 'https://github.com/DTAJ095/portfolio-project',
      },
    ];

    final titleColor = _isDarkMode
        ? Colors.deepPurpleAccent
        : Colors.deepPurple;
    final isMobile = screenWidth < 600;
    // Laptop: 900px-1400px, Desktop: >1400px, Tablet: 600-900px, Mobile: <600px
    // int crossAxisCount;
    // if (screenWidth >= 1400) {
    //   crossAxisCount = 1;
    // } else if (screenWidth >= 900) {
    //   crossAxisCount = 1;
    // } else {
    //   crossAxisCount = 1;
    // }
    // final childAspectRatio = isMobile ? 2.2 : 3.5;
    return Padding(
      key: key,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60.0 : 80.0,
        horizontal: isMobile ? 16.0 : 40.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: GoogleFonts.readexPro(
              textStyle: TextStyle(
                fontSize: isMobile ? 24 : 36,
                color: titleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 10 : 20),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: projects.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: _buildProjectContainer(projects[index], isMobile),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: isMobile ? 20 : 30);
            },
          ),
          // GridView.builder(
          //   shrinkWrap: true,
          //   physics: AlwaysScrollableScrollPhysics(),
          //   itemCount: projects.length,
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: crossAxisCount,
          //     crossAxisSpacing: 10.0,
          //     mainAxisSpacing: 10.0,
          //     childAspectRatio: childAspectRatio,
          //   ),
          //   itemBuilder: (context, index) {
          //     return _buildProjectCard(projects[index], isMobile);
          //   },
          // ),
        ],
      ),
    );
  }

  Widget _buildProjectContainer(Map<String, String> project, bool isMobile) {
    final textColor = _isDarkMode ? Colors.white : Colors.black87;
    final desColor = _isDarkMode ? Colors.white70 : Colors.black54;
    final backgroundColor = _isDarkMode
        ? const Color.fromARGB(255, 77, 30, 158)
        : Colors.blue.shade100;
    return OnHoverContainer(
      child: Container(
        height: 490,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: _isDarkMode ? Colors.white : Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Card(
          elevation: 10,
          color: backgroundColor,
          child: Padding(
            padding: EdgeInsets.all(isMobile ? 16.0 : 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project['name'] ?? 'Project Name',
                  style: GoogleFonts.readexPro(
                    textStyle: TextStyle(
                      fontSize: isMobile ? 20 : 24,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
                SizedBox(height: isMobile ? 8 : 12),
                Expanded(
                  child: Text(
                    project['description'] ?? 'Project Description',
                    style: GoogleFonts.aleo(
                      textStyle: TextStyle(
                        fontSize: isMobile ? 14 : 16,
                        color: desColor,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                OnHoverButton(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: isMobile ? 100.0 : 120.0,
                    child: MaterialButton(
                      onPressed: () {
                        if (project['link'] != null) {
                          _launchURL(project['link']!);
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            'View Project',
                            style: GoogleFonts.aBeeZee(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: _isDarkMode
                                    ? Colors.amberAccent
                                    : Colors.black,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_sharp,
                            color: _isDarkMode
                                ? Colors.amberAccent
                                : Colors.black,
                            size: 15.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // InkWell(
                //   onHover: (value) => _isHovering(),
                //   highlightColor: _isDarkMode
                //       ? Colors.deepPurpleAccent.withAlpha(30)
                //       : Colors.deepPurple.withAlpha(30),
                //   customBorder: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(8),
                //   ),
                //   borderRadius: BorderRadius.circular(8),
                //   onTap: () => {
                //     if (project['link'] != null) {_launchURL(project['link']!)},
                //   },
                //   child: Row(
                //     children: [
                //       Text(
                //         'View Project',
                //         style: GoogleFonts.readexPro(
                //           textStyle: TextStyle(
                //             fontSize: isMobile ? 14 : 16,
                //             color: Colors.white,
                //           ),
                //         ),
                //       ),
                //       Icon(
                //         Icons.arrow_forward,
                //         color: Colors.white,
                //         size: isMobile ? 16 : 20,
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildProjectCard(Map<String, String> project, bool isMobile) {
  //   final cardTextColor = _isDarkMode ? Colors.white : Colors.black87;
  //   final cardDescColor = _isDarkMode ? Colors.white70 : Colors.black54;
  //   final cardBgColor = _isDarkMode
  //       ? Colors.deepPurple.shade900
  //       : Colors.blue.shade100;
  //   return StatefulBuilder(
  //     builder: (context, setState) {
  //       return InkWell(
  //         onTap: () {
  //           if (project['link'] != null) {
  //             _launchURL(project['link']!);
  //           }
  //         },
  //         onHover: (value) => setState(() {}),
  //         child: AnimatedContainer(
  //           duration: Duration(milliseconds: 300),
  //           curve: Curves.easeInOut,
  //           decoration: BoxDecoration(
  //             color: cardBgColor,
  //             borderRadius: BorderRadius.circular(15),
  //           ),
  //           child: Padding(
  //             padding: EdgeInsets.all(isMobile ? 12.0 : 20.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   project['name'] ?? 'Project Name',
  //                   style: GoogleFonts.readexPro(
  //                     textStyle: TextStyle(
  //                       fontSize: isMobile ? 16 : 20,
  //                       fontWeight: FontWeight.bold,
  //                       color: cardTextColor,
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(height: isMobile ? 6 : 10),
  //                 Expanded(
  //                   child: Text(
  //                     project['description'] ?? 'Project Description',
  //                     style: GoogleFonts.aleo(
  //                       textStyle: TextStyle(
  //                         fontSize: isMobile ? 12 : 14,
  //                         color: cardDescColor,
  //                         height: 1.4,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      // You can show a SnackBar or an alert dialog here
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not launch $url')));
    }
  }

  Widget _buildContactSection({
    required GlobalKey key,
    required double screenWidth,
  }) {
    final contactBgColor = _isDarkMode
        ? const Color.fromARGB(255, 23, 2, 27).withValues()
        : Colors.blue.shade100.withValues();
    final titleColor = _isDarkMode
        ? Colors.deepPurpleAccent
        : Colors.deepPurple;
    final textColor = _isDarkMode ? Colors.white70 : Colors.black87;
    final iconColor = _isDarkMode ? Colors.white : Colors.deepPurple;
    final isMobile = screenWidth < 600;
    return Container(
      key: key,
      width: double.infinity,
      color: contactBgColor,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 30.0 : 60.0,
        horizontal: isMobile ? 16.0 : 40.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Contact Me',
            style: GoogleFonts.readexPro(
              textStyle: TextStyle(
                fontSize: isMobile ? 24 : 36,
                color: titleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 10 : 20),
          Text(
            'Feel free to get in touch! I am always open to discussing new projects, creative ideas, or opportunities to be part of your visions.',
            style: GoogleFonts.aleo(
              textStyle: TextStyle(
                fontSize: isMobile ? 12 : 16,
                color: textColor,
                height: 1.5,
              ),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 20 : 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.google,
                  color: iconColor,
                  size: isMobile ? 28 : 36,
                ),
                onPressed: () => _launchURL('mailto:albanjaures26@gmail.com'),
              ),
              SizedBox(width: isMobile ? 10 : 20),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.linkedin,
                  color: iconColor,
                  size: isMobile ? 28 : 36,
                ),
                onPressed: () =>
                    _launchURL('https://www.linkedin.com/in/alban-jaures'),
              ),
              SizedBox(width: isMobile ? 10 : 20),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.github,
                  color: iconColor,
                  size: isMobile ? 28 : 36,
                ),
                onPressed: () => _launchURL('https://github.com/DTAJ095'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(double screenWidth) {
    final footerBgColor = _isDarkMode
        ? Colors.blue.shade800
        : Colors.blue.shade200;
    final footerTextColor = _isDarkMode ? Colors.white54 : Colors.black54;
    final isMobile = screenWidth < 600;
    return Container(
      width: double.infinity,
      color: footerBgColor,
      padding: EdgeInsets.all(isMobile ? 10.0 : 20.0),
      child: Text(
        '© 2025 Alban Jaures. All Rights Reserved.',
        style: TextStyle(
          color: footerTextColor,
          fontSize: isMobile ? 8.0 : 10.0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/data/projects.dart';
import 'package:portfolio/widgets/my_nav_button.dart';
import 'package:portfolio/widgets/on_hover_container.dart';

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  get onPressed => null;

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  bool _isPressed = false;
  bool _isHovered = false;
  int _isActiveIndex = -1; // -1 = none active
  final Color textColor = Colors.black;

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void setPressed(bool pressed) {
    setState(() {
      _isPressed = pressed;
    });
  }

  void onEntered(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  void onSkillEntered(int index) {
    setState(() {
      _isActiveIndex = index;
      _isHovered = index != -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = constraints.maxWidth;
        final bgColor = Colors.white;

        // Responsive helpers
        final bool isMobile = screenWidth < 600;
        final bool isTablet = screenWidth >= 600 && screenWidth < 900;
        final bool isLaptop = screenWidth >= 900 && screenWidth < 1400;
        final bool isDesktop = screenWidth >= 1400;

        // Projects grid columns
        int projectsColumns;
        if (isDesktop) {
          projectsColumns = 4;
        } else if (isLaptop) {
          projectsColumns = 2; // laptop shows 2 columns as requested
        } else if (isTablet) {
          projectsColumns = 2;
        } else {
          projectsColumns = 1;
        }

        return Scaffold(
          backgroundColor: bgColor,
          body: SafeArea(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // Top bar
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 16.0 : 40.0,
                      vertical: isMobile ? 12.0 : 20.0,
                    ),
                    color: bgColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Alban Jaures',
                          style: GoogleFonts.readexPro(
                            fontSize: isMobile ? 20 : 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        // nav buttons: wrap when small
                        Flexible(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Wrap(
                              spacing: isMobile ? 8.0 : 20.0,
                              runSpacing: 8.0,
                              children: [
                                MyNavButton(
                                  child: Text(
                                    'About',
                                    style: GoogleFonts.readexPro(
                                      textStyle: TextStyle(
                                        color: _isPressed
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                  onPressed: () => _scrollToSection(_aboutKey),
                                ),
                                MyNavButton(
                                  child: Text(
                                    'Projects',
                                    style: GoogleFonts.readexPro(
                                      textStyle: TextStyle(
                                        color: _isPressed
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                  onPressed: () =>
                                      _scrollToSection(_projectsKey),
                                ),
                                MyNavButton(
                                  child: Text(
                                    'Skills',
                                    style: GoogleFonts.readexPro(
                                      textStyle: TextStyle(
                                        color: _isPressed
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                  onPressed: () => _scrollToSection(_skillsKey),
                                ),
                                MyNavButton(
                                  child: Text(
                                    'Contact',
                                    style: GoogleFonts.readexPro(
                                      textStyle: TextStyle(
                                        color: _isPressed
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                  onPressed: () =>
                                      _scrollToSection(_contactKey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Header / hero - responsive width and padding
                  Container(
                    height: isMobile ? null : 400,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      horizontal: isMobile ? 16.0 : 40.0,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: isMobile ? 24.0 : 40.0,
                      horizontal: isMobile ? 16.0 : 24.0,
                    ),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 23, 163, 77),
                          Color.fromARGB(255, 121, 160, 179),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: isMobile
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 56,
                                backgroundImage: AssetImage('assets/mypic.jpg'),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Alban Jaures',
                                style: GoogleFonts.readexPro(
                                  textStyle: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Software Engineer • Flutter Developer',
                                style: GoogleFonts.readexPro(
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: isTablet ? 64 : 80,
                                backgroundImage: AssetImage('assets/mypic.jpg'),
                              ),
                              const SizedBox(width: 24),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Alban Jaures',
                                      style: GoogleFonts.readexPro(
                                        textStyle: TextStyle(
                                          fontSize: isLaptop ? 26 : 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Column(
                                      children: [
                                        Text(
                                          'Software Engineer',
                                          style: GoogleFonts.readexPro(
                                            textStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Flutter Developer',
                                          style: GoogleFonts.readexPro(
                                            textStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Certified Backend Developer',
                                          style: GoogleFonts.readexPro(
                                            textStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                  ),

                  const SizedBox(height: 28),

                  // About
                  Container(
                    key: _aboutKey,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 16.0 : 40.0,
                      vertical: isMobile ? 16.0 : 24.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About Me',
                          style: GoogleFonts.readexPro(
                            textStyle: TextStyle(
                              fontSize: isMobile ? 22 : 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.only(right: isMobile ? 0 : 120.0),
                          child: Text(
                            'Software developer passionate about new technologies. I am specialize in building robust and scalable applications as a full-stack software engineer. My expertise lies in backend development using Python and Node.js, where I design and implement APIs, manage databases, and ensure system performance. On the frontend, I use Flutter to create beautiful and responsive user interfaces that deliver a seamless experience across multiple platforms.\n\nI am committed to writing clean, maintainable code and continuously improving my skills to stay updated with the latest industry trends. Let\'s connect and create something amazing together!',
                            style: GoogleFonts.aleo(
                              textStyle: TextStyle(
                                fontSize: isMobile ? 14 : 18,
                                height: 1.5,
                                color: textColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Projects - responsive grid (shrink-wrapped so page scrolls naturally)
                  Container(
                    key: _projectsKey,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 16.0 : 40.0,
                      vertical: isMobile ? 20.0 : 40.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Projects',
                          style: GoogleFonts.readexPro(
                            textStyle: TextStyle(
                              fontSize: isMobile ? 22 : 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: projectList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: projectsColumns,
                                crossAxisSpacing: isMobile ? 12 : 24,
                                mainAxisSpacing: isMobile ? 12 : 24,
                                childAspectRatio: isMobile ? 1.1 : 1.8,
                              ),
                          itemBuilder: (context, index) {
                            return OnHoverContainer(
                              child: Padding(
                                padding: EdgeInsets.all(isMobile ? 12.0 : 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      projectList[index].title,
                                      style: GoogleFonts.readexPro(
                                        textStyle: TextStyle(
                                          fontSize: isMobile ? 16 : 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Expanded(
                                      child: Text(
                                        projectList[index].description,
                                        style: GoogleFonts.aleo(
                                          textStyle: TextStyle(
                                            fontSize: isMobile ? 12 : 16,
                                            height: 1.5,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Learn More',
                                      style: GoogleFonts.readexPro(
                                        textStyle: TextStyle(
                                          fontSize: isMobile ? 12 : 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Skills - responsive layout; when hovered highlight one and dim others
                  Container(
                    key: _skillsKey,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 16.0 : 40.0,
                      vertical: isMobile ? 16.0 : 24.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Skills',
                          style: GoogleFonts.readexPro(
                            textStyle: TextStyle(
                              fontSize: isMobile ? 22 : 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        // On small screens use Wrap (stacked), otherwise a row of cards
                        isMobile
                            ? Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: List.generate(4, (i) {
                                  final bool isActive = _isActiveIndex == i;
                                  final bool anyHovered = _isActiveIndex != -1;
                                  // Titles for the skill containers
                                  final titles = [
                                    'Programming Languages',
                                    'Frameworks',
                                    'Databases',
                                    'Agiles Methodologies',
                                  ];
                                  return MouseRegion(
                                    onEnter: (_) => onSkillEntered(i),
                                    onExit: (_) => onSkillEntered(-1),
                                    child: AnimatedContainer(
                                      duration: const Duration(
                                        milliseconds: 200,
                                      ),
                                      width: (screenWidth - 48) / 2,
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: isActive
                                              ? const [
                                                  Color.fromARGB(
                                                    255,
                                                    236,
                                                    232,
                                                    232,
                                                  ),
                                                  Color.fromARGB(
                                                    255,
                                                    184,
                                                    185,
                                                    187,
                                                  ),
                                                ]
                                              : anyHovered
                                              ? [
                                                  Colors.grey.shade200,
                                                  Colors.grey.shade300,
                                                ]
                                              : const [
                                                  Color.fromARGB(
                                                    255,
                                                    236,
                                                    232,
                                                    232,
                                                  ),
                                                  Color.fromARGB(
                                                    255,
                                                    184,
                                                    185,
                                                    187,
                                                  ),
                                                ],
                                        ),
                                        boxShadow: isActive
                                            ? [
                                                BoxShadow(
                                                  color: const Color.fromARGB(
                                                    255,
                                                    136,
                                                    6,
                                                    148,
                                                  ).withOpacity(0.9),
                                                  spreadRadius: 3,
                                                  blurRadius: 10,
                                                  offset: const Offset(0, 4),
                                                ),
                                              ]
                                            : anyHovered
                                            ? [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  spreadRadius: 1,
                                                  blurRadius: 6,
                                                  offset: const Offset(0, 2),
                                                ),
                                              ]
                                            : [
                                                BoxShadow(
                                                  color: Colors.deepPurpleAccent
                                                      .withOpacity(0.2),
                                                  spreadRadius: 1,
                                                  blurRadius: 6,
                                                  offset: const Offset(0, 2),
                                                ),
                                              ],
                                      ),
                                      height: 180,
                                      // Add the title into the container
                                      child: Center(
                                        child: Text(
                                          titles[i],
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.readexPro(
                                            textStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: isActive
                                                  ? Colors.deepPurple
                                                  : Colors.black87,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(4, (i) {
                                  final bool isActive = _isActiveIndex == i;
                                  final bool anyHovered = _isActiveIndex != -1;
                                  return Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: isLaptop ? 8.0 : 12.0,
                                      ),
                                      child: MouseRegion(
                                        onEnter: (_) => onSkillEntered(i),
                                        onExit: (_) => onSkillEntered(-1),
                                        child: AnimatedContainer(
                                          duration: const Duration(
                                            milliseconds: 200,
                                          ),
                                          height: isMobile ? 160 : 360,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              20.0,
                                            ),
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: isActive
                                                  ? const [
                                                      Color.fromARGB(
                                                        255,
                                                        236,
                                                        232,
                                                        232,
                                                      ),
                                                      Color.fromARGB(
                                                        255,
                                                        184,
                                                        185,
                                                        187,
                                                      ),
                                                    ]
                                                  : anyHovered
                                                  ? [
                                                      Colors.grey.shade200,
                                                      Colors.grey.shade300,
                                                    ]
                                                  : const [
                                                      Color.fromARGB(
                                                        255,
                                                        236,
                                                        232,
                                                        232,
                                                      ),
                                                      Color.fromARGB(
                                                        255,
                                                        184,
                                                        185,
                                                        187,
                                                      ),
                                                    ],
                                            ),
                                            boxShadow: isActive
                                                ? [
                                                    BoxShadow(
                                                      color:
                                                          const Color.fromARGB(
                                                            255,
                                                            136,
                                                            6,
                                                            148,
                                                          ).withOpacity(0.9),
                                                      spreadRadius: 5,
                                                      blurRadius: 12,
                                                      offset: const Offset(
                                                        0,
                                                        6,
                                                      ),
                                                    ),
                                                  ]
                                                : anyHovered
                                                ? [
                                                    BoxShadow(
                                                      color: Colors.black12,
                                                      spreadRadius: 1,
                                                      blurRadius: 6,
                                                      offset: const Offset(
                                                        0,
                                                        2,
                                                      ),
                                                    ),
                                                  ]
                                                : [
                                                    BoxShadow(
                                                      color: Colors
                                                          .deepPurpleAccent
                                                          .withOpacity(0.2),
                                                      spreadRadius: 1,
                                                      blurRadius: 6,
                                                      offset: const Offset(
                                                        0,
                                                        3,
                                                      ),
                                                    ),
                                                  ],
                                          ),
                                          // Add title into desktop container
                                          child: Center(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: isMobile ? 10 : 20,
                                                ),
                                                Text(
                                                  i == 0
                                                      ? 'Programming Languages'
                                                      : i == 1
                                                      ? 'Frameworks'
                                                      : i == 2
                                                      ? 'Databases'
                                                      : 'Agiles Methodologies',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.readexPro(
                                                    textStyle: TextStyle(
                                                      fontSize: isLaptop
                                                          ? 18
                                                          : 22,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: isActive
                                                          ? Colors.deepPurple
                                                          : Colors.black87,
                                                    ),
                                                  ),
                                                ),
                                                Column(children: []),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Contact + footer
                  Container(
                    key: _contactKey,
                    height: 200,
                    color: Colors.black,
                    child: const Center(
                      child: Text(
                        'Contact area',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    color: const Color.fromARGB(255, 71, 13, 82),
                    child: const Center(
                      child: Text(
                        'Copyright © 2025 Alban Jaures. All rights reserved.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

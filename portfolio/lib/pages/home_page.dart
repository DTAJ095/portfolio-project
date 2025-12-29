import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:portfolio/data/educ_work_exp.dart';
import 'package:portfolio/data/projects.dart';
import 'package:portfolio/data/skills.dart';
import 'package:portfolio/widgets/circle_loader.dart';
import 'package:portfolio/widgets/my_nav_button.dart';
import 'package:portfolio/widgets/on_hover_button.dart';
import 'package:portfolio/widgets/on_hover_container.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final String location = 'Biyem Assi, Yaounde, Cameroon';
  final String email = 'albanjaures26@gmail.com';
  final String phone = '+237 690 72 54 11';
  final String githubUrl = '';
  final String linkedinUrl = '';
  final String twitterUrl = '';
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
                              spacing: isMobile ? 6.0 : 20.0,
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
                                        fontSize: isMobile ? 10 : 16,
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
                                        fontSize: isMobile ? 10 : 16,
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
                                        fontSize: isMobile ? 10 : 16,
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
                                        fontSize: isMobile ? 10 : 16,
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
                          Color.fromARGB(255, 18, 19, 18),
                          Color.fromARGB(255, 50, 53, 54),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: isMobile
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                    color: Colors.white,
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
                                    color: Colors.white,
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
                                          color: Colors.white,
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
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Flutter Developer',
                                          style: GoogleFonts.readexPro(
                                            textStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Certified Backend Developer',
                                          style: GoogleFonts.readexPro(
                                            textStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
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
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.only(right: isMobile ? 0 : 120.0),
                          child: Text(
                            'Software developer passionate about new technologies. I am specialize in building robust and scalable applications as a full-stack software engineer. My expertise lies in backend development using Python and Node.js, where I design and implement APIs, manage databases, and ensure system performance. On the frontend, I use Flutter to create beautiful and responsive user interfaces that deliver a seamless experience across multiple platforms.\n\nI am self-taught learner and committed to writing clean, maintainable code and continuously improving my skills to stay updated with the latest industry trends. Let\'s connect and create something amazing together!',
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
                              color: Colors.black,
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
                                    OnHoverButton(
                                      child: SizedBox(
                                        width: isMobile ? 100 : 200,
                                        child: Row(
                                          children: [
                                            Text(
                                              'View Project',
                                              style: GoogleFonts.readexPro(
                                                textStyle: TextStyle(
                                                  fontSize: isMobile ? 12 : 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: isMobile ? 4 : 8),
                                            IconButton(
                                              onPressed: () {
                                                _launchURL(
                                                  projectList[index].link,
                                                );
                                              },
                                              icon: Icon(
                                                Icons.arrow_forward,
                                                color: Colors.white,
                                                size: isMobile ? 14 : 18,
                                              ),
                                            ),
                                          ],
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
                    height: isMobile ? null : 700.0,
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
                              color: Colors.black,
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
                                                  Color.fromARGB(255, 19, 4, 4),
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
                                      height: isMobile ? 160 : 360,
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
                                      child: isMobile
                                          ? Container(color: Colors.blue)
                                          : MouseRegion(
                                              onEnter: (_) => onSkillEntered(i),
                                              onExit: (_) => onSkillEntered(-1),
                                              child: AnimatedContainer(
                                                duration: const Duration(
                                                  milliseconds: 200,
                                                ),
                                                height: isMobile ? 160 : 500,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
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
                                                            const Color.fromARGB(
                                                              255,
                                                              10,
                                                              1,
                                                              1,
                                                            ),
                                                            const Color.fromARGB(
                                                              255,
                                                              7,
                                                              6,
                                                              6,
                                                            ),
                                                          ]
                                                        : const [
                                                            Color.fromARGB(
                                                              255,
                                                              7,
                                                              7,
                                                              7,
                                                            ),
                                                            Color.fromARGB(
                                                              255,
                                                              22,
                                                              23,
                                                              24,
                                                            ),
                                                          ],
                                                  ),
                                                  boxShadow: isActive
                                                      ? [
                                                          BoxShadow(
                                                            color:
                                                                const Color.fromARGB(
                                                                  255,
                                                                  11,
                                                                  1,
                                                                  12,
                                                                ).withOpacity(
                                                                  0.9,
                                                                ),
                                                            spreadRadius: 5,
                                                            blurRadius: 12,
                                                            offset:
                                                                const Offset(
                                                                  0,
                                                                  6,
                                                                ),
                                                          ),
                                                        ]
                                                      : anyHovered
                                                      ? [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black12,
                                                            spreadRadius: 1,
                                                            blurRadius: 6,
                                                            offset:
                                                                const Offset(
                                                                  0,
                                                                  2,
                                                                ),
                                                          ),
                                                        ]
                                                      : [
                                                          BoxShadow(
                                                            color: Colors
                                                                .deepPurpleAccent
                                                                .withOpacity(
                                                                  0.2,
                                                                ),
                                                            spreadRadius: 1,
                                                            blurRadius: 6,
                                                            offset:
                                                                const Offset(
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
                                                        height: isMobile
                                                            ? 10
                                                            : 20,
                                                      ),
                                                      Text(
                                                        skillsData[i].category,
                                                        style: GoogleFonts.readexPro(
                                                          textStyle: TextStyle(
                                                            fontSize: isMobile
                                                                ? 16
                                                                : 20,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: isActive
                                                                ? const Color.fromARGB(
                                                                    255,
                                                                    4,
                                                                    2,
                                                                    7,
                                                                  )
                                                                : Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          // Add skills details
                                                          SizedBox(
                                                            height: isMobile
                                                                ? 8
                                                                : 16,
                                                          ),
                                                          ...skillsData[i].skills.map(
                                                            (skill) => Padding(
                                                              padding:
                                                                  EdgeInsets.only(
                                                                    bottom:
                                                                        isMobile
                                                                        ? 4
                                                                        : 8,
                                                                  ),
                                                              child: Padding(
                                                                padding: EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      isMobile
                                                                      ? 8.0
                                                                      : 20.0,
                                                                  vertical:
                                                                      isMobile
                                                                      ? 4.0
                                                                      : 14.0,
                                                                ),
                                                                child: Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Image(
                                                                      image: AssetImage(
                                                                        skill
                                                                            .iconPath,
                                                                      ),
                                                                      width:
                                                                          isMobile
                                                                          ? 14
                                                                          : 30,
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          isMobile
                                                                          ? 6
                                                                          : 12,
                                                                    ),
                                                                    Text(
                                                                      skill
                                                                          .name,
                                                                      style: GoogleFonts.aleo(
                                                                        textStyle: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontSize:
                                                                              isMobile
                                                                              ? 12
                                                                              : 16,
                                                                          color:
                                                                              isActive
                                                                              ? Colors.black54
                                                                              : Colors.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Spacer(),
                                                                    CircleLoader(
                                                                      child: CircularPercentIndicator(
                                                                        animationDuration:
                                                                            500,
                                                                        radius:
                                                                            isMobile
                                                                            ? 16.0
                                                                            : 24.0,
                                                                        lineWidth:
                                                                            isMobile
                                                                            ? 3.0
                                                                            : 5.0,
                                                                        percent:
                                                                            skill.proficiency /
                                                                            100,
                                                                        center: Text(
                                                                          '${skill.proficiency.toInt()}%',
                                                                          style: GoogleFonts.aleo(
                                                                            textStyle: TextStyle(
                                                                              fontSize: isMobile
                                                                                  ? 10
                                                                                  : 14,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: isActive
                                                                                  ? Colors.black54
                                                                                  : Colors.black,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        progressColor:
                                                                            isActive
                                                                            ? const Color.fromARGB(
                                                                                255,
                                                                                0,
                                                                                0,
                                                                                0,
                                                                              )
                                                                            : Colors.black,
                                                                        backgroundColor:
                                                                            isActive
                                                                            ? const Color.fromARGB(
                                                                                31,
                                                                                0,
                                                                                0,
                                                                                0,
                                                                              )
                                                                            : Colors.black26,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
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

                  SizedBox(height: isMobile ? 10 : 20),
                  // Education and Experience
                  Container(
                    height: isMobile ? 400 : 800,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 16.0 : 40.0,
                      vertical: isMobile ? 16.0 : 30.0,
                    ),
                    child: isMobile
                        ? Column()
                        : Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isMobile ? 10.0 : 20.0,
                                    vertical: isMobile ? 10.0 : 20.0,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [Colors.purple, Colors.blue],
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          // Image.asset(
                                          //   'assets/logos/educate.jpeg',
                                          //   width: isMobile ? 16 : 30,
                                          // ),
                                          Icon(
                                            FontAwesomeIcons.graduationCap,
                                            color: Colors.white,
                                            size: isMobile ? 16 : 30,
                                          ),
                                          SizedBox(width: isMobile ? 8 : 16),
                                          Text(
                                            'Education',
                                            style: GoogleFonts.readexPro(
                                              textStyle: TextStyle(
                                                fontSize: isMobile ? 16 : 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // Add education details
                                      ...educationData.map(
                                        (edu) => Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: isMobile ? 4.0 : 10.0,
                                            horizontal: isMobile ? 8.0 : 20.0,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      right: isMobile ? 6 : 12,
                                                    ),
                                                  ),
                                                  Icon(
                                                    edu.icon,
                                                    color: Colors.white,
                                                    size: isMobile ? 14 : 24,
                                                  ),
                                                  SizedBox(
                                                    width: isMobile ? 6 : 12,
                                                  ),
                                                  Text(
                                                    edu.institution,
                                                    style: GoogleFonts.aleo(
                                                      textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: isMobile
                                                            ? 12
                                                            : 16,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: isMobile
                                                      ? 20.0
                                                      : 40.0,
                                                  vertical: isMobile
                                                      ? 4.0
                                                      : 8.0,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      edu.certificate,
                                                      style: GoogleFonts.aleo(
                                                        textStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: isMobile
                                                              ? 10
                                                              : 14,
                                                          color: Colors.white70,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      edu.date,
                                                      style: GoogleFonts.aleo(
                                                        textStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: isMobile
                                                              ? 10
                                                              : 14,
                                                          color: Colors.white70,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: isMobile ? 6 : 12,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.book,
                                            color: Colors.white,
                                            size: isMobile ? 16 : 30,
                                          ),
                                          SizedBox(width: isMobile ? 8 : 16),
                                          Text(
                                            'Curriculums',
                                            style: GoogleFonts.readexPro(
                                              textStyle: TextStyle(
                                                fontSize: isMobile ? 16 : 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          // Add curriculum details
                                          ...curriculumData.map(
                                            (curriculum) => Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: isMobile ? 4.0 : 10.0,
                                                horizontal: isMobile
                                                    ? 8.0
                                                    : 20.0,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    curriculum.title,
                                                    style: GoogleFonts.aleo(
                                                      textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: isMobile
                                                            ? 12
                                                            : 16,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: isMobile
                                                              ? 20.0
                                                              : 40.0,
                                                          vertical: isMobile
                                                              ? 4.0
                                                              : 8.0,
                                                        ),
                                                    child: Text(
                                                      curriculum.description,
                                                      style: GoogleFonts.aleo(
                                                        textStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: isMobile
                                                              ? 10
                                                              : 14,
                                                          color: Colors.white70,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: isMobile ? 10 : 20),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [Colors.blue, Colors.purple],
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: isMobile ? 10.0 : 20.0,
                                      vertical: isMobile ? 10.0 : 20.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.briefcase,
                                              color: Colors.white,
                                              size: isMobile ? 16 : 30,
                                            ),
                                            SizedBox(width: isMobile ? 8 : 16),
                                            Text(
                                              'Work Experience',
                                              style: GoogleFonts.readexPro(
                                                textStyle: TextStyle(
                                                  fontSize: isMobile ? 16 : 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // Add work experience details here
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                  SizedBox(height: isMobile ? 10 : 20),
                  // Contact + footer
                  Container(
                    key: _contactKey,
                    height: isMobile ? 100 : 200,
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 16.0 : 40.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: isMobile ? 10 : 20),
                              Text(
                                'Address: $location',
                                style: GoogleFonts.readexPro(
                                  textStyle: TextStyle(
                                    fontSize: isMobile ? 10 : 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: isMobile ? 8 : 16),
                              Text(
                                'Email: $email',
                                style: GoogleFonts.readexPro(
                                  textStyle: TextStyle(
                                    fontSize: isMobile ? 10 : 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: isMobile ? 8 : 16),
                              Text(
                                'Phone: $phone',
                                style: GoogleFonts.readexPro(
                                  textStyle: TextStyle(
                                    fontSize: isMobile ? 10 : 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () => _launchURL(githubUrl),
                              icon: Icon(
                                FontAwesomeIcons.github,
                                color: Colors.white,
                                size: isMobile ? 16 : 24,
                              ),
                            ),
                            SizedBox(width: isMobile ? 16 : 32),
                            IconButton(
                              onPressed: () => _launchURL(linkedinUrl),
                              icon: Icon(
                                FontAwesomeIcons.linkedin,
                                color: Colors.white,
                                size: isMobile ? 16 : 24,
                              ),
                            ),
                            SizedBox(width: isMobile ? 16 : 32),
                            IconButton(
                              onPressed: () => _launchURL(twitterUrl),
                              icon: Icon(
                                FontAwesomeIcons.twitter,
                                color: Colors.white,
                                size: isMobile ? 16 : 24,
                              ),
                            ),
                            SizedBox(width: isMobile ? 16 : 32),
                          ],
                        ),
                      ],
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

  void _launchURL(String url) {
    launchUrl(Uri.parse(url));
  }
}

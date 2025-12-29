import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Education {
  final String certificate;
  final String institution;
  final String date;
  final IconData? icon;

  Education({
    required this.icon,
    required this.certificate,
    required this.institution,
    required this.date,
  });
}

final List<Education> educationData = [
  Education(
    icon: FontAwesomeIcons.squareFontAwesome,
    certificate: 'Bachelor Degree in Computer Software Engineering',
    institution: 'MATAMFEN HIGH INSTITUTE',
    date: 'October 2023 - September 2024',
  ),
  Education(
    icon: FontAwesomeIcons.squareFontAwesome,
    certificate: 'High National Diploma in Computer Engineering',
    institution: 'MATAMFEN HIGH INSTITUTE',
    date: 'October 2021 - August 2023',
  ),
  Education(
    icon: FontAwesomeIcons.squareFontAwesome,
    certificate: 'Bachelor of Science in Physics',
    institution: 'University of Yaounde I',
    date: '2017',
  ),
];

class Curriculum {
  final String title;
  final String description;
  final String link;

  Curriculum({
    required this.title,
    required this.description,
    required this.link,
  });
}

final List<Curriculum> curriculumData = [
  Curriculum(
    title: 'ALX Ai for Developers Curriculum',
    description:
        'A comprehensive curriculum covering fundamental and advanced topics in using and leveraging AI for development, including machine learning, natural language processing, and computer vision.',
    link: 'https://example.com/computer-science-curriculum',
  ),
  Curriculum(
    title: 'ALX Software Engineering Curriculum',
    description:
        'An in-depth curriculum focused on software development methodologies, project management, quality assurance, and best practices in software engineering.',
    link: 'https://example.com/software-engineering-curriculum',
  ),
];

class WorkExperience {
  final String position;
  final String company;
  final String duration;
  final IconData? icon;

  WorkExperience({
    required this.icon,
    required this.position,
    required this.company,
    required this.duration,
  });
}

final List<WorkExperience> workExperienceData = [
  WorkExperience(
    icon: FontAwesomeIcons.briefcase,
    position: 'Software Engineer',
    company: 'Tech Solutions Inc.',
    duration: 'June 2022 - Present',
  ),
  WorkExperience(
    icon: FontAwesomeIcons.briefcase,
    position: 'Junior Developer',
    company: 'Innovatech Ltd.',
    duration: 'January 2021 - May 2022',
  ),
  WorkExperience(
    icon: FontAwesomeIcons.briefcase,
    position: 'IT Assistant',
    company: 'Some Company',
    duration: 'Some Duration',
  ),
];

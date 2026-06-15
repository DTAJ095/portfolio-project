import 'package:flutter_riverpod/flutter_riverpod.dart';

class Projects {
  final String title;
  final String description;
  final String link;

  Projects({
    required this.title,
    required this.description,
    required this.link,
  });
}

final List<Projects> projectList = [
  Projects(
    title: 'Personal Portfolio',
    description: 'A personal portfolio website built with Flutter.',
    link: 'www.example.com',
  ),
  Projects(
    title: 'E-commerce App',
    description: 'A full-featured e-commerce mobile application.',
    link: 'www.example.com',
  ),
  Projects(
    title: 'Personal Finance Tracker',
    description: 'Your personal finance management app.',
    link: 'www.example.com',
  ),
  Projects(
    title: 'Simple Shell',
    description: 'A simple command-line shell implementation.',
    link: 'www.example.com',
  ),
  Projects(
    title: 'AfricaStay',
    description: 'A hospitality platform for African travelers.',
    link: 'www.example.com',
  ),
];

final projectsProvider = Provider<List<Projects>>((ref) {
  return projectList;
});

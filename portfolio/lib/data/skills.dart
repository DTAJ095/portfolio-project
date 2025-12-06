class Skills {
  final String skillTitle;
  final String skillIcon;
  final List skillList;
  Skills({
    required this.skillTitle,
    required this.skillIcon,
    required this.skillList,
  });
}

final List<Skills> skillsList = [
  Skills(
    skillTitle: 'Programming Languages',
    skillIcon: 'assets/icons/programming.png',
    skillList: ['Dart', 'JavaScript', 'Python', 'Java', 'C++'],
  ),
  Skills(
    skillTitle: 'Frameworks & Libraries',
    skillIcon: 'assets/icons/frameworks.png',
    skillList: ['Flutter', 'React', 'Node.js', 'Express.js', 'TensorFlow'],
  ),
  Skills(
    skillTitle: 'Databases & Tools',
    skillIcon: 'assets/icons/tools.png',
    skillList: ['Git & GitHub', 'Firebase', 'Docker', 'VS Code', 'JIRA'],
  ),
  Skills(
    skillTitle: 'Agiles Methodologies',
    skillIcon: '',
    skillList: ['Scrum', 'Kanban'],
  ),
];

class Skill {
  final String name;
  final String iconPath;

  Skill({required this.name, required this.iconPath});
}

class SkillsList {
  final String category;
  final List<Skill> skills;
  SkillsList({required this.category, required this.skills});
}

final List<SkillsList> skillsData = [
  SkillsList(
    category: 'Programming Languages',
    skills: [
      Skill(name: 'Dart', iconPath: ''),
      Skill(name: 'JavaScript', iconPath: ''),
      Skill(name: 'Python', iconPath: ''),
      Skill(name: 'C++', iconPath: ''),
    ],
  ),
  SkillsList(
    category: 'Frameworks & Libraries',
    skills: [
      Skill(name: 'Flutter', iconPath: ''),
      Skill(name: 'React', iconPath: ''),
      Skill(name: 'Node.js', iconPath: ''),
      Skill(name: 'TensorFlow', iconPath: ''),
    ],
  ),
  SkillsList(
    category: 'Tools & Platforms',
    skills: [
      Skill(name: 'Git', iconPath: ''),
      Skill(name: 'Docker', iconPath: ''),
      Skill(name: 'Firebase', iconPath: ''),
      Skill(name: 'AWS', iconPath: ''),
    ],
  ),
  SkillsList(
    category: 'Methodologies',
    skills: [
      Skill(name: 'Agile', iconPath: ''),
      Skill(name: 'Scrum', iconPath: ''),
      Skill(name: 'Test-Driven Development', iconPath: ''),
      Skill(name: 'CI/CD', iconPath: ''),
    ],
  ),
];

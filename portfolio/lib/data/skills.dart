class Skill {
  final String name;
  final String iconPath;
  final double proficiency; // Proficiency level from 0.0 to 100%

  Skill({
    required this.name,
    required this.iconPath,
    required this.proficiency,
  });
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
      Skill(name: 'Dart', iconPath: 'assets/logos/dart.png', proficiency: 75.0),
      Skill(
        name: 'JavaScript',
        iconPath: 'assets/logos/javascript.png',
        proficiency: 85.0,
      ),
      Skill(
        name: 'Python',
        iconPath: 'assets/logos/python.png',
        proficiency: 80.0,
      ),
      Skill(name: 'C++', iconPath: 'assets/logos/c++.png', proficiency: 75.0),
    ],
  ),
  SkillsList(
    category: 'Frameworks & Libraries',
    skills: [
      Skill(
        name: 'Flutter',
        iconPath: 'assets/logos/flutter.png',
        proficiency: 80.0,
      ),
      Skill(
        name: 'React',
        iconPath: 'assets/logos/react.png',
        proficiency: 50.0,
      ),
      Skill(
        name: 'Node.js',
        iconPath: 'assets/logos/node.png',
        proficiency: 80.0,
      ),
      Skill(
        name: 'TensorFlow',
        iconPath: 'assets/logos/tensorflow.png',
        proficiency: 75.0,
      ),
    ],
  ),
  SkillsList(
    category: 'Tools & Platforms',
    skills: [
      Skill(
        name: 'Git',
        iconPath: 'assets/logos/GitLab.png',
        proficiency: 80.0,
      ),
      Skill(
        name: 'GitHub',
        iconPath: 'assets/logos/GitHub.png',
        proficiency: 80.0,
      ),
      Skill(
        name: 'Docker',
        iconPath: 'assets/logos/docker.png',
        proficiency: 85.0,
      ),
      Skill(
        name: 'Firebase',
        iconPath: 'assets/logos/firebase.png',
        proficiency: 50.0,
      ),
      Skill(name: 'AWS', iconPath: 'assets/logos/aws.png', proficiency: 75.0),
    ],
  ),
  SkillsList(
    category: 'Methodologies',
    skills: [
      Skill(
        name: 'Agile',
        iconPath: 'assets/logos/agile.png',
        proficiency: 70.0,
      ),
      Skill(
        name: 'Scrum',
        iconPath: 'assets/logos/scrum.png',
        proficiency: 65.0,
      ),
      Skill(
        name: 'Test-Driven Development',
        iconPath: 'assets/logos/TDD.png',
        proficiency: 60.0,
      ),
      Skill(
        name: 'CI/CD',
        iconPath: 'assets/logos/CI & CD.png',
        proficiency: 55.0,
      ),
    ],
  ),
];

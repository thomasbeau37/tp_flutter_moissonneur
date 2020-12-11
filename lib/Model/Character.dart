class Character {
  Character({this.name, this.weapon, this.level, this.description});

  final String name;
  final String weapon;
  final String level;
  final String description;

  Character.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        weapon = json['weapon'],
        level = json['level'],
        description = json['description'];
}
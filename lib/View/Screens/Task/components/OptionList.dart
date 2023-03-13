import 'dart:ui';

class Option {
  final String title;
  final String icon;
  final Color color ;

  Option({
    required this.title,
    required this.icon,
    required this.color,
  });
}

final List<Option> options = [
 Option(title: "To do", icon: "assets/to-do-list.png", color:  Color.fromRGBO(17, 154, 253, 1)),
  Option(title: "In Progress", icon: "assets/settings.png", color: Color.fromRGBO(107, 119, 232, 1)),
  Option(title: "Done", icon: "assets/verify.png", color: Color.fromRGBO(56, 232, 148, 1)),
  Option(title: "Features", icon: 'assets/feature.png', color: Color.fromRGBO(151, 159, 239, 1)),
  Option(title: "Issues", icon:'assets/maintenance.png', color: Color.fromRGBO(51, 185, 239, 1))

];
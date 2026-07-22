class StatisticsContinarModel {
  final String name;
  final String icon;
  final int? count;
  final bool prsentpercentage;
  final bool havespeed;

  StatisticsContinarModel({
    required this.name,
    required this.icon,
    this.count,
    required this.prsentpercentage,
    this.havespeed = false,
  });
}

class GenderRate {
  final double male;
  final double female;

  const GenderRate({
    required this.male,
    required this.female,
  });

  String get malePercentage => "${(male * 100).toStringAsFixed(1)}%";

  String get femalePercentage => "${(female * 100).toStringAsFixed(1)}%";
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization.dart';

// **************************************************************************
// SheetLocalizationGenerator
// **************************************************************************

final localizedLabels = <Locale, AppLocalizationsData>{
  const Locale.fromSubtags(languageCode: 'en'): const AppLocalizationsData(
    floors: 'Floors',
    dashboard: 'Dashboard',
    welcome: 'Welcome to Flash POS',
  ),
  const Locale.fromSubtags(languageCode: 'zh'): const AppLocalizationsData(
    floors: '地板',
    dashboard: '仪表板',
    welcome: '欢迎来到 Flash POS',
  ),
  const Locale.fromSubtags(languageCode: 'fr'): const AppLocalizationsData(
    floors: 'Sols',
    dashboard: 'Tableau de bord',
    welcome: 'Bienvenue sur Flash POS',
  ),
  const Locale.fromSubtags(languageCode: 'vi'): const AppLocalizationsData(
    floors: 'Khu vực',
    dashboard: 'Bảng điều khiển',
    welcome: 'Chào mừng đến với Flash POS',
  ),
};

class AppLocalizationsData {
  const AppLocalizationsData({
    required this.floors,
    required this.dashboard,
    required this.welcome,
  });

  final String floors;
  final String dashboard;
  final String welcome;
  factory AppLocalizationsData.fromJson(Map<String, Object?> map) =>
      AppLocalizationsData(
        floors: map['floors']! as String,
        dashboard: map['dashboard']! as String,
        welcome: map['welcome']! as String,
      );

  AppLocalizationsData copyWith({
    String? floors,
    String? dashboard,
    String? welcome,
  }) =>
      AppLocalizationsData(
        floors: floors ?? this.floors,
        dashboard: dashboard ?? this.dashboard,
        welcome: welcome ?? this.welcome,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsData &&
          floors == other.floors &&
          dashboard == other.dashboard &&
          welcome == other.welcome);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      floors.hashCode ^
      dashboard.hashCode ^
      welcome.hashCode;
}

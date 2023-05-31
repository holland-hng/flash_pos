import 'dart:ui';

enum LocaleType {
  english,
  french,
  chinese,
  vietnamese,
}

extension LocaleTypeExtension on LocaleType {
  Locale get locale {
    String key;
    switch (this) {
      case LocaleType.english:
        key = 'en';
        break;
      case LocaleType.french:
        key = 'fr';
        break;
      case LocaleType.chinese:
        key = 'zh';
        break;
      case LocaleType.vietnamese:
        key = 'vi';
        break;
      default:
        throw UnimplementedError();
    }
    return Locale(key);
  }
}

extension LocaleKeyString on String {
  LocaleType get locale {
    switch (this) {
      case 'en':
        return LocaleType.english;
      case 'fr':
        return LocaleType.french;
      case 'zh':
        return LocaleType.chinese;
      case 'vi':
        return LocaleType.vietnamese;
      default:
        return LocaleType.english;
    }
  }
}

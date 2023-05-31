import 'package:core_ui/localization/locale_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UIConfiguration {
  final LocaleType localeType;

  const UIConfiguration({
    required this.localeType,
  });

  static const localeKey = 'locale_cache_key';

  static Future<UIConfiguration> getInstance({SharedPreferences? prefs}) async {
    LocaleType localeType;
    prefs ??= await SharedPreferences.getInstance();

    try {
      final localeDataString = prefs.getString(UIConfiguration.localeKey);
      localeType = localeDataString!.locale;
    } catch (e) {
      localeType = LocaleType.english;
    }
    return UIConfiguration(
      localeType: localeType,
    );
  }
}

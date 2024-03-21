import 'package:beigi_portfolio/generated/locales.g.dart' as locale;
import 'package:get/get.dart';

class LocalizationService extends Translations {
  Map<String, String> fa = {}, en = {};

  LocalizationService() {
    fa.addAll(locale.Locales.fa_IR);
    en.addAll(locale.Locales.en_US);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'fa': fa,
        'en': en,
      };
}

import 'package:url_launcher/url_launcher.dart';

class Utilities {
  static Future<void> openUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  static Future<void> openMail() =>
      openUrl(Uri.https('mailto:ghelejbeigiali@gmail.com'));

  static Future<void> openMyLocation() =>
      openUrl(Uri.https('maps.app.goo.gl', '/GgCJKmjexDHLrpBf6'));

  static Future<void> openMyPhoneNo() => launch("tel:+98-9354492839");

  static Future<void> openWhatsapp() =>
      openUrl(Uri.https("wa.me", "/9354492839"));
}

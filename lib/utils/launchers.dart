import 'package:url_launcher/url_launcher.dart';

Future<void> openGoogleMaps(double lat, double lng) async {
  final String googleMapsUrl =
      "https://www.google.com/maps/search/?api=1&query=$lat,$lng";
  final Uri url = Uri.parse(googleMapsUrl);

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not open Google Maps';
  }
}

void openPhoneDialer(String phoneNumber) async {
  final String phoneUrl = 'tel:$phoneNumber';
  final Uri url = Uri.parse(phoneUrl);

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not open the phone dialer';
  }
}

void openWhatsAppChat(String phoneNumber) async {
  final String whatsappUrl = 'https://wa.me/$phoneNumber';
  final Uri url = Uri.parse(whatsappUrl);

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not open WhatsApp';
  }
}

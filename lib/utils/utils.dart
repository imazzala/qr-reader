import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/scan_models.dart';

Future<void> launchUrlQR(BuildContext context, ScanModel scan) async {
  final Uri url = Uri.parse(scan.value);

  if (scan.type == 'http') {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  } else {
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}

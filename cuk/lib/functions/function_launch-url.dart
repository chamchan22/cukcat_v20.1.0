import 'package:url_launcher/url_launcher.dart';

void LaunchUrlFunction(String url) async {
  String _url = url;
  if (await canLaunch(_url)) {
    await launch(_url);
  } else {
    throw 'Could not launch $_url';
  }
}
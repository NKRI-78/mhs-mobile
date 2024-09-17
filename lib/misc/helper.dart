import 'package:mhs_mobile/modules/connectivity/bloc/connectivity_bloc.dart';
import 'package:mhs_mobile/modules/connectivity/bloc/connectivity_event.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class Helper {
  static Future<void> openLink({required String url}) async {
    final uri = Uri.parse(url);

  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
    }
  }
}
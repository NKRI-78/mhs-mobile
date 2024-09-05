import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/repositories/payment_repository/models/payment_model.dart';
import 'package:mhs_mobile/widgets/images/image_card.dart';
import 'package:url_launcher/url_launcher.dart';

class QrMethodWidget extends StatelessWidget {
  const QrMethodWidget({super.key, required this.payment});

  final PaymentModel payment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageCard(
          image: payment.data?["actions"][0]["url"] ?? "-", 
          radius: 10
        ),
        const Text(
          "Atau Bayar Langsung di Aplikasi Gopay",
          style: TextStyle(),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: greenColor
          ),
          onPressed: () {
            openLink(payment.data?["actions"][1]["url"]);
          }, 
          child: const Text("Bayar Dengan Gopay")
        )
      ],
    );
  }
}

Future<void> openLink(String url) async {
  final uri = Uri.parse(url);

  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
}
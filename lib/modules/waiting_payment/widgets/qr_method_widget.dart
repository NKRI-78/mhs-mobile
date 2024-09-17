import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:mhs_mobile/misc/download_manager.dart';
import 'package:mhs_mobile/misc/helper.dart';
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Biaya Pendaftaran",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text('Rp ${NumberFormat('#,##0.00', 'ID').format(payment.amount ?? 0)}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          "Biaya Layanan",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text('Rp ${NumberFormat('#,##0.00', 'ID').format(int.parse(payment.paymentFee.toString()) ?? 0)}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          "Total Pembayaran",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'Rp ${NumberFormat('#,##0.00', 'ID').format(payment.totalAmount ?? 0)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                try {
                  await Clipboard.setData(
                      ClipboardData(text: payment.amount?.toString() ?? '0'));
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Berhasil copy total pembayaran')));
                  }
                } catch (e) {
                  ///
                }
              },
              child: const Row(
                children: [
                  Text(
                    'Salin',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Icon(
                    Iconsax.copy,
                    color: primaryColor,
                  )
                ],
              ),
            )
          ],
        ),
        ImageCard(
          image: payment.data?["actions"][0]["url"] ?? "-", 
          radius: 10
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 200,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextButton(
                onPressed: (){
                  DownloadHelper.downloadDoc(context: context, url: payment.data?["actions"][0]["url"] ?? "-");
                }, 
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.download,
                      size: 20,
                      color: whiteColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Download QR Image",
                      style: TextStyle(
                        color: whiteColor
                      ),
                    )
                  ],
                )
              ),
            ),
            const Text(
              "Atau Bayar Langsung di Aplikasi Gopay",
              style: TextStyle(),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: greenColor
                ),
                onPressed: () {
                  Helper.openLink(url: payment.data?["actions"][1]["url"]);
                }, 
                child: const Text("Bayar Dengan Gopay")
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ],
    );
  }
}
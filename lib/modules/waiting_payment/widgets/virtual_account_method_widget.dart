import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/repositories/payment_repository/models/payment_model.dart';

class VirtualAccountMethodWidget extends StatelessWidget {
  const VirtualAccountMethodWidget({super.key, required this.payment});

  final PaymentModel payment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        const Text(
          "Nomor Virtual Account",
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
                payment.data?['vaNumber'] ?? '',
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
                      ClipboardData(text: payment.data?['vaNumber'] ?? ''));
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Berhasil Copy nomor VA')));
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
                'Rp ${NumberFormat('#,##0.00', 'ID').format(payment.amount ?? 0)}',
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
        const SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
              color: primaryColor.withOpacity(.3),
              border: Border.all(
                color: primaryColor,
              ),
              borderRadius: BorderRadius.circular(6)),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: const Row(
            children: [
              Icon(
                Iconsax.info_circle,
                color: primaryColor,
                size: 35,
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Text(
                    'Tidak disarankan transfer Virtual Account dari bank selain yang dipilih.'),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}

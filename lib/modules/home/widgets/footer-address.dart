import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';

class FooterAddress extends StatelessWidget {
  const FooterAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
            height: 50,
          ),
          const Text(
            "MHS Bandar Lampung",
            style: TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.w500,
              fontSize: fontSizeOverLarge
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text(
              "Komplek Shopping Arcade Transmart Lampung unit 72-73 B Jalan Sultan Agung Nomor 283, Jalur 2 Way Halim Permai Bandar Lampung 35821 Telp 08117239946",
              style: TextStyle(
                color: whiteColor,
                fontWeight: FontWeight.w500,
                fontSize: fontSizeDefault
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              side: const BorderSide(
                width: 2,
                color: whiteColor,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: (){}, 
            child: const Text(
              "Buka Peta",
              style: TextStyle(
                fontSize: fontSizeSmall,
                color: whiteColor
              ),
            )
          )
        ],
      ),
    );
  }
}
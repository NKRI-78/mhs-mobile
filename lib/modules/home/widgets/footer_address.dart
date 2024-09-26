import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/helper.dart';
import 'package:mhs_mobile/misc/theme.dart';

class FooterAddress extends StatelessWidget {
  const FooterAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
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
            onPressed: (){
              Helper.openLink(
                url: "https://www.google.com/maps/place/METRO+HOTEL+SCHOOL/@-5.3838085,105.2826569,19z/data=!4m14!1m7!3m6!1s0x2e40dbfa660eb40d:0x57cb3bdb262e151!2sTransmart+Carrefour+Bandar+Lampung!8m2!3d-5.383467!4d105.2821746!16s%2Fg%2F11ghrd61bs!3m5!1s0x2e40dbfcf24a5771:0x150647e37a9bc91f!8m2!3d-5.3838617!4d105.2826479!16s%2Fg%2F11q2kfxkfy?entry=ttu&g_ep=EgoyMDI0MDkyMi4wIKXMDSoASAFQAw%3D%3D",
                context: context
              );
            }, 
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
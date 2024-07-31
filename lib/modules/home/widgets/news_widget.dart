import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhs_mobile/misc/theme.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      children: [
        const Row(
          children: [
            Text(
              'Berita',
              style: TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            Text(
              'See All',
              style: TextStyle(
                color: redColor,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: const [
            NewWidget(),
          ],
        ),
      ],
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width * .3,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: double.infinity,
            child: Image.asset(
              'assets/images/banner_metro.png',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Mahasiswa Metro Hotel School Titip Bantuan Korban Kebakaran Kaliawi ke ACT Lampung',
                    style: GoogleFonts.roboto().copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Bagi sekitar 13 keluarga di Kompleks Perumahan Jalan Raden Patah Gang',
                    style: GoogleFonts.roboto().copyWith(
                      fontSize: 11,
                      color: const Color(0xff000000).withOpacity(.5),
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

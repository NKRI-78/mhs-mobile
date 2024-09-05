import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/router/builder.dart';

class MenusWidget extends StatelessWidget {
  const MenusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            MenuWidget(
              title: 'Acara',
              icon: "icon_calendar_event", 
              onTap: () { 
                EventRoute().go(context);
              },
            ),
            MenuWidget(
              title: 'Kemitraan',
              icon: "Handshake", 
              onTap: () { 
                PartnershipRoute().go(context);
              },
            ),
            MenuWidget(
              title: 'Media',
              icon: "icon_gallery", 
              onTap: () { 
                MediaRoute().go(context); 
              },
            ),
            MenuWidget(
              title: 'Presentasi',
              icon: "Presentation", 
              onTap: () { 
                ListPresentationRoute().go(context);
              },
            ),
            MenuWidget(
              title: 'Brosur',
              icon: "Magazine", 
              onTap: () { 
                ListBrochureRoute().go(context);
               },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key, required this.title, required this.icon, required this.onTap});
  final String title;
  final String icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              height: 51,
              width: 51,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: redColor,
              ),
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(
                bottom: 4,
              ),
              child: Image.asset(
                "assets/icons/$icon.png",
                width: 5,
                height: 5,
                scale: 0.5,
              ),
            ),
            Text(
              title,
              style: GoogleFonts.inter().copyWith(
                color: primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}

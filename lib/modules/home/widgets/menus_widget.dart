import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhs_mobile/misc/theme.dart';

class MenusWidget extends StatelessWidget {
  const MenusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.only(left: 32.0),
          child: Row(
            children: [
              MenuWidget(
                title: 'Event',
              ),
              MenuWidget(
                title: 'Partnership',
              ),
              MenuWidget(
                title: 'Media',
              ),
              MenuWidget(
                title: 'Persentation',
              ),
              MenuWidget(
                title: 'Brochure',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        children: [
          Container(
            height: 51,
            width: 51,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: redColor,
            ),
            margin: const EdgeInsets.only(
              bottom: 4,
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
    );
  }
}

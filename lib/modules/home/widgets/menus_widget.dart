import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/home/model/app_bar_menu_model.dart';
import 'package:mhs_mobile/router/builder.dart';


class MenusWidget extends StatelessWidget {
  const MenusWidget({super.key, required this.role});

  final String role;

  @override
  Widget build(BuildContext context) {
    List<AppbarMenuModel> listMenu = [
      AppbarMenuModel(
        title: 'Event',
        icon: "icon_calendar_event", 
        onTap: () { 
          EventRoute().go(context);
        },
      ),
      AppbarMenuModel(
        title: 'Partnership',
        icon: "Handshake", 
        onTap: () { 
          PartnershipRoute().go(context);
        },
      ),
      AppbarMenuModel(
        title: 'Media',
        icon: "icon_gallery", 
        onTap: () { 
          MediaRoute().go(context); 
        },
      ),
      AppbarMenuModel(
        title: 'Brosur',
        icon: "Magazine", 
        onTap: () { 
          ListBrochureRoute().go(context);
        },
      ),
      AppbarMenuModel(
        title: 'Nilai',
        icon: "Scorecard", 
        onTap: () { 
          GradeRoute().go(context);
        },
      ),
    ];
    return GridView.builder(
    shrinkWrap: true,
    physics: const ScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      mainAxisSpacing: role == "STUDENT" ? 0 : 10.0,
      crossAxisSpacing: role == "STUDENT" ? 0 : 10.0,
      crossAxisCount: role == "STUDENT" ? 5 : 4,
    ),
    itemCount: role == "STUDENT" ? listMenu.length : 4,
    itemBuilder: (context, index) {
      final data = listMenu[index];
      return MenuWidget(
        title: data.title,
        icon: data.icon, 
        onTap: data.onTap,
      );
    });
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key, required this.title, required this.icon, required this.onTap});
  final String title;
  final String icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
              bottom: 5,
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
              color: primaryColor.withOpacity(0.80),
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/router/builder.dart';

class MenuStudent extends StatelessWidget {
  const MenuStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: MenuWidget(
              title: 'Event',
              icon: "icon_calendar_event",
              onTap: () {
                EventRoute().go(context);
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: MenuWidget(
              title: 'PPOB',
              icon: "icon_ppob",
              onTap: () {},
            ),
          ),
          Expanded(
            flex: 1,
            child: MenuWidget(
              title: 'Media',
              icon: "icon_gallery",
              onTap: () {
                MediaRoute().go(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});
  final String title;
  final String icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: redColor,
        ),
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/$icon.png",
              width: 20,
              height: 20,
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                color: whiteColor,
                fontSize: fontSizeExtraLarge
              ),
            )
          ],
        ),
      ),
    );
  }
}

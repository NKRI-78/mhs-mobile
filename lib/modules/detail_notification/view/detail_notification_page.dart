import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/repositories/notification_repository/model/notificaiton_model.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';

class DetailNotificationPage extends StatelessWidget {
  const DetailNotificationPage({super.key, required this.notifData});

  final NotifData notifData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        slivers: [
          HeaderSection(
            title: notifData.type, 
            isCircle: true,
            isPrimary: false,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    notifData.data.title,
                    style: const TextStyle(
                      fontSize: fontSizeOverLarge,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    notifData.data.description,
                    style: const TextStyle(
                      fontSize: fontSizeDefault,
                    ),
                  ),
                )
              ]),
            ),
          )
        ]
      ),
    );
  }
}
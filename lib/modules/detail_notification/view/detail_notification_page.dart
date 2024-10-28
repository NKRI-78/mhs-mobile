import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/home/bloc/home_bloc.dart';
import 'package:mhs_mobile/repositories/notification_repository/model/notificaiton_model.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';

import '../../notification/bloc/notification_bloc.dart';

class DetailNotificationPage extends StatelessWidget {
  const DetailNotificationPage({super.key, required this.notifData});

  final NotifData notifData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationBloc()..add(NotificationInitial()),
      child: DetailNotificationView(notifData: notifData,)
    );
  }
}

class DetailNotificationView extends StatefulWidget {
  const DetailNotificationView({super.key, required this.notifData});

  final NotifData notifData;

  @override
  State<DetailNotificationView> createState() => _DetailNotificationViewState();
}

class _DetailNotificationViewState extends State<DetailNotificationView> {
  @override
  void initState() {
    getIt<NotificationBloc>().add(NotifRead(idNotif: widget.notifData.id));
    super.initState();
  }

  @override
  void dispose() {
    getIt<NotificationBloc>().add(NotifcationRefreshInfo());
    getIt<NotificationBloc>().add(NotifCount());
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    print("Count Trans : ${getIt<NotificationBloc>().state.countTrasaction}");
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        slivers: [
          HeaderSection(
            title: widget.notifData.type, 
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
                    widget.notifData.data.title,
                    style: const TextStyle(
                      fontSize: fontSizeOverLarge,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    widget.notifData.data.description,
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
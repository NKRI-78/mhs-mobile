import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/detail_notification/cubit/detail_notification_cubit.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';
import 'package:mhs_mobile/widgets/pages/page_empty.dart';
import 'package:mhs_mobile/widgets/pages/pages_loading.dart';

import '../../notification/bloc/notification_bloc.dart';

class DetailNotificationPage extends StatelessWidget {
  const DetailNotificationPage({super.key, required this.idNotif});

  final int idNotif;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailNotificationCubit>(
      create: (context) => DetailNotificationCubit()..fetchDetailNotif(idNotif),
      child: DetailNotificationView(id: idNotif,)
    );
  }
}

class DetailNotificationView extends StatelessWidget {
  const DetailNotificationView({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailNotificationCubit, DetailNotificationState>(
        buildWhen: (previous, current) => previous.detailNotifModel != current.detailNotifModel,
        builder: (context, state) {
          return CustomScrollView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            slivers: [
              const HeaderSection(
                title: "BROADCAST", 
                isCircle: true,
                isPrimary: false,
              ),
              state.loadingNotif ? const SliverFillRemaining(
                child: Center(child: LoadingPage()),
              ) : state.detailNotifModel?.data == null ? const SliverFillRemaining(
                child: Center(child: EmptyPage(msg: "Notif tidak ditemukan"))) : SliverPadding(
                padding: const EdgeInsets.all(10.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        state.detailNotifModel?.data?.title ?? "-",
                        style: const TextStyle(
                          fontSize: fontSizeOverLarge,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Html(
                        data: state.detailNotifModel?.data?.message ?? "-",
                        style: {
                          "a": Style(
                            color: Colors.blue,
                          ),
                        },
                        onLinkTap: (String? url, Map<String, String> attributes, element) async {
                          WebViewRoute(url: url!, title: "MHS-MOBILE").go(context);
                        },
                      ),
                    )
                  ]),
                ),
              )
            ]
          );
        }
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/home/bloc/home_bloc.dart';
import 'package:mhs_mobile/modules/notification/bloc/notification_bloc.dart';
import 'package:mhs_mobile/modules/notification/widgets/tab_bar_notif_widget.dart';
import 'package:mhs_mobile/modules/notification/widgets/tab_information.dart';
import 'package:mhs_mobile/modules/notification/widgets/tab_transaction.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationBloc()..add(NotificationInitial()),
      child: const NotificationView()
    );
  }
}

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  void dispose() {
    getIt<NotificationBloc>().add(NotifcationRefreshInfo());
    getIt<HomeBloc>().add(GetCounNotif());
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        print("Page Next Client: ${state.pagination.next}");
        return Scaffold(
          backgroundColor: greyColor,
          body: SmartRefresher(
            onRefresh: () async {
              getIt<NotificationBloc>().add(NotifcationRefreshInfo());
            },
            controller: NotificationBloc.notifRefreshInfoCtrl,
            enablePullUp: state.pagination.next == null ? false : true,
            enablePullDown: true,
            onLoading: () async {
              context.read<NotificationBloc>().add(NotifLoadMore());
            },
            child: CustomScrollView(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              slivers: [
                const HeaderSection(
                  title: "Notifikasi", 
                  isCircle: true,
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                    const TabBarNotif()
                  ])
                ),
                SliverList(
                      delegate: SliverChildListDelegate([
                    BlocBuilder<NotificationBloc, NotificationState>(
                      buildWhen: (previous, current) =>
                          previous.tabIndex != current.tabIndex,
                      builder: (context, state) {
                        if (state.tabIndex == 0) {
                          return const TabTransaction();
                        } else {
                          return const TabInformation();
                        }
                      },
                    )
                  ])
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
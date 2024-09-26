import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/notification/bloc/notification_bloc.dart';
import 'package:mhs_mobile/modules/notification/widgets/tab_bar_notif_widget.dart';
import 'package:mhs_mobile/modules/notification/widgets/tab_information.dart';
import 'package:mhs_mobile/modules/notification/widgets/tab_transaction.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';

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

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor,
      body: CustomScrollView(
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
    );
  }
}
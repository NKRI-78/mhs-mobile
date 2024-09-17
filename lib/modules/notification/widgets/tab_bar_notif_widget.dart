import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/notification/bloc/notification_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';

class TabBarNotif extends StatelessWidget {
  const TabBarNotif({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      buildWhen: (previous, current) => false,
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          initialIndex: state.tabIndex,
          child: TabBar(
            automaticIndicatorColorAdjustment: true,
            indicatorColor: redColor,
            dividerColor: Colors.transparent,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: primaryColor
            ),
            onTap: (value) {
              final cubit = context.read<NotificationBloc>();
              cubit.add(NotificationCopyState(
                  newState: cubit.state.copyWith(tabIndex: value)));
            },
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            tabs: const [
              TextWithBadge(title: 'Informasi', index: 1,),
              TextWithBadge(title: 'Payment', index: 2,),
            ],
          ),
        );
      },
    );
  }
}

class TextWithBadge extends StatelessWidget {
  const TextWithBadge({super.key, required this.title, required this.index});

  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
          ),
        ),
      ],
    );
  }
}

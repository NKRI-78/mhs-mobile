import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/notification/bloc/notification_bloc.dart';


class TabBarNotif extends StatelessWidget {
  const TabBarNotif({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
         debugPrint("Now Count Client: ${state.countNotif}");
        return DefaultTabController(
          length: 2,
          initialIndex: state.tabIndex,
          child: TabBar(
            automaticIndicatorColorAdjustment: true,
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
            tabs: [
              const TextWithBadge(title: 'Pembayaran', countNotif: 0,),
              TextWithBadge(title: 'Informasi', countNotif: state.countNotif,),
            ],
          ),
        );
      },
    );
  }
}

class TextWithBadge extends StatelessWidget {
  const TextWithBadge({super.key, required this.title, required this.countNotif});

  final String title;
  final int countNotif;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          fit: StackFit.loose,
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                title,
              ),
            ),
            countNotif != 0 ? Positioned(
                right: -18,
                top: 5,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: redColor,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text(
                    "$countNotif",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: whiteColor,
                      fontSize: fontSizeExtraSmall
                    ),
                  ),
                ),
              ) : const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/detail_event/cubit/event_detail_cubit.dart';
import 'package:mhs_mobile/modules/detail_event/widget/detail_event.dart';
import 'package:mhs_mobile/widgets/extension/date_util.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';
import 'package:mhs_mobile/widgets/pages/page_empty.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key, required this.idEvent});

  final int idEvent;

  @override
  Widget build(BuildContext context) {
    debugPrint("id event $idEvent");
    return BlocProvider<EventDetailCubit>(
      create: (context) => EventDetailCubit()..fetchDetailEvent(idEvent),
      child: EventDetailView(
        idEvent: idEvent,
      ),
    );
  }
}

class EventDetailView extends StatelessWidget {
  const EventDetailView({super.key, required this.idEvent});

  final int idEvent;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventDetailCubit, EventDetailState>(
      buildWhen: (previous, current) => previous.event != current.event,
      builder: (context, state) {
        final data = state.event?.data;

        debugPrint("is joined ? ${data?.isJoin ?? false}");
        debugPrint("is expired ? ${data?.isExpired ?? false}");
        return Scaffold(
          backgroundColor: whiteColor,
          body: Stack(
            clipBehavior: Clip.none,
            children: [ 
              CustomScrollView(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  const HeaderSection(
                    title: "Event Detail", 
                    isCircle: false,
                    isPrimary: true,
                  ),
                  state.loading ? const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator.adaptive()),
                ) : state.event == null ? const SliverFillRemaining(
                  child: Center(child: EmptyPage(msg: "Tidak ada Event"))) : SliverList(
                    delegate: SliverChildListDelegate([
                      DetailEventList(
                        imageUrl: data?.imageUrl ?? "", 
                        title: data?.title ?? "", 
                        address: data?.address ?? "", 
                        description: data?.description ?? "", 
                        date: '${DateUntil.formatDateEvent(data?.startDate ?? DateTime.now())} - ${DateUntil.formatDateEvent(data?.endDate ?? DateTime.now())}',
                      )
                    ])
                  )
                ]
              ),
              // JoinButton(
              //   joined: data?.isJoin ?? false, 
              //   isExpired: data?.isExpired ?? false, 
              //   onPressed: () async { 
              //     GeneralModal.showConfirmModal(
              //       msg: 'yakin ingin join ?', 
              //       context: context, 
              //       onPressed: () async { 
              //         await context.read<EventDetailCubit>().jointEvent(context,idEvent.toString());
              //         Future.delayed(Duration.zero, () {
              //           GoRouter.of(context).pop();
              //           GoRouter.of(context).pop();
              //         });
              //        }, 
              //        locationImage: 'assets/icons/joined-event.png'
              //     );
              //   },
              // )
            ]
          ),
        );
      }
    );
  }
}
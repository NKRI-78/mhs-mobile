import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/notification/bloc/notification_bloc.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/extension/date_util.dart';
import 'package:mhs_mobile/widgets/pages/page_empty.dart';
import 'package:mhs_mobile/widgets/pages/pages_loading.dart';

class TabInformation extends StatelessWidget {
  const TabInformation({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      buildWhen: (previous, current) => previous.notif != current.notif,
      builder: (context, state) {
        return state.loading == true ? const LoadingPage() : state.notif?.isEmpty ?? true ? const EmptyPage(msg: "Tidak ada Informasi") : ListView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: state.notif?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              final data = state.notif?[index];
              return InkWell(
                onTap: () async {
                  context.read<NotificationBloc>().add(NotifRead(idNotif: data?.id ?? 0));
                  DetailNotifRoute(id: data?.data.data.id ?? 0).go(context);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: data?.readAt != null ? whiteColor : greyDescColor.withOpacity(0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(13))
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.info_outline,
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                               data?.data.title ?? "",
                              maxLines: 2,
                              style: const TextStyle(
                                color: blackColor,
                                fontSize: fontSizeSmall,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                            Text(
                               data?.data.description.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), "") ?? "",
                              maxLines: 2,
                              style: const TextStyle(
                                color: greyDescColor,
                                fontSize: fontSizeSmall,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          textAlign: TextAlign.center,
                          DateUntil.formatDate(DateTime.parse(data?.createdAt ?? "")),
                          style: const TextStyle(
                            color: blackColor,
                            fontSize: fontSizeSmall,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          );
      },
    );
  }
}
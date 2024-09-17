import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/notification/bloc/notification_bloc.dart';
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
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    color: data?.data == null ? whiteColor.withOpacity(0.09) : null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Row(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.info_outline,
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Text(
                                   data?.data.title ?? "",
                                  maxLines: 2,
                                  style: const TextStyle(
                                    color: blackColor,
                                    fontSize: fontSizeSmall,
                                    fontWeight: FontWeight.w400
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              // Text(
                              //   textAlign: TextAlign.center,
                              //   data?.type ?? "",
                              //   style: const TextStyle(
                              //     color: blackColor,
                              //     fontSize: fontSizeSmall,
                              //     fontWeight: FontWeight.w400
                              //   ),
                              // ),
                              Text(
                                textAlign: TextAlign.center,
                                DateUntil.formatDate(data?.createdAt ?? DateTime.now()),
                                style: const TextStyle(
                                  color: blackColor,
                                  fontSize: fontSizeSmall,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
          );
      },
    );
  }
}
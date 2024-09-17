import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/notification/bloc/notification_bloc.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/extension/date_util.dart';
import 'package:mhs_mobile/widgets/pages/page_empty.dart';
import 'package:mhs_mobile/widgets/pages/pages_loading.dart';

class TabTransaction extends StatelessWidget {
  const TabTransaction({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        debugPrint("Name Notif ${state.payment}");
        return state.loading == true ? const LoadingPage() : state.notif?.isEmpty ?? true ? const EmptyPage(msg: "Tidak ada Informasi") : ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: state.payment?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              final data = state.payment?[index];
              if (state.loading == true) {
                return const SizedBox.expand(
                  child: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                );
              }
              return InkWell(
                onTap: () {
                  WaitingPaymentRoute(id: data?.paymentNumber ?? "").go(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
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
                              Expanded(
                                flex: 1,
                                child: Image.asset(
                                  "assets/icons/money-icon.png"
                                ),
                              ),
                              const Spacer(),
                              Expanded(
                                flex: 5,
                                child: Text(
                                   data?.paymentGetOneOrder?.type == "REGISTER_STUDENT" ? "Pendaftaran Siswa Baru" : "",
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
                          child: Text(
                            textAlign: TextAlign.end,
                            DateUntil.formatDate(DateTime.parse(data?.createdAt ?? "")),
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
                ),
              );
            }
          );
      },
    );
  }
}
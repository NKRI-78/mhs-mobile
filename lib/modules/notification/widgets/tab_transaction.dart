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
      buildWhen: (previous, current) => previous.payment != current.payment,
      builder: (context, state) {
        return state.loading == true ? const LoadingPage() : state.payment?.isEmpty ?? true ? const EmptyPage(msg: "Tidak ada transaksi") : ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: state.payment?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              final data = state.payment?[index];
              debugPrint("Payment data : ${state.payment?.length}");
              if (state.loading) {
                return const SizedBox.expand(
                  child: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                );
              }
              return InkWell(
                onTap: () {
                  WaitingPaymentNotifRoute(id: data?.paymentNumber ?? "").go(context);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(13))
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            "assets/icons/money-icon.png"
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                 data?.paymentGetOneOrder?.type == "REGISTER_STUDENT" ? "Pendaftaran Siswa Baru" : "",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: blackColor,
                                  fontSize: fontSizeSmall,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                              Text(
                                 data?.paymentGetOneOrder?.orderNumber ?? "",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: greyDescColor,
                                  fontSize: fontSizeSmall,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
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
              );
            }
          );
      },
    );
  }
}
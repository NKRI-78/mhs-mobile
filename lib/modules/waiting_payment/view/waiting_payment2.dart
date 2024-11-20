import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/waiting_payment/cubit/waiting_payment_cubit.dart';
import 'package:mhs_mobile/modules/waiting_payment/widgets/qr_method_widget.dart';
import 'package:mhs_mobile/modules/waiting_payment/widgets/virtual_account_method_widget.dart';
import 'package:mhs_mobile/widgets/images/image_card.dart';
import 'package:mhs_mobile/widgets/pages/page_success_payment.dart';
import 'package:slide_countdown/slide_countdown.dart';

class WaitingPaymentPage extends StatelessWidget {
  final String id;
  const WaitingPaymentPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WaitingPaymentCubit>(
      create: (context) => WaitingPaymentCubit(id: id)..init(),
      child: const WaitingPaymentView(),
    );
  }
}

class WaitingPaymentView extends StatefulWidget {
  const WaitingPaymentView({super.key});

  @override
  State<WaitingPaymentView> createState() => _WaitingPaymentViewState();
}

class _WaitingPaymentViewState extends State<WaitingPaymentView> {
  late bool isExpired;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isExpired = false;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Pembayaran",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: primaryColor,
      ),
      body: BlocBuilder<WaitingPaymentCubit, WaitingPaymentState>(
        builder: (context, state) {
          final targetDateTime = DateTime.parse(state.payment!.createdAt!).add(
            state.payment?.paymentMethod == "GOPAY" ? const Duration(
              days: 1,
            ) : const Duration(
              minutes: 15,
            ),
          ); 
          final duration = targetDateTime.difference(DateTime.now());

          debugPrint("Duration ${duration.inMinutes}");
          debugPrint("Date ${DateTime.now()}");

          if (state.loading) {
            return const SizedBox.expand(
              child: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          }
          if (state.payment == null) {
            return const SizedBox.shrink();
          }
          return RefreshIndicator(
            onRefresh: () async {
              await context.read<WaitingPaymentCubit>().onRefresh();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Status",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SlideCountdownSeparated(
                          duration:  Duration(minutes: duration.inMinutes),
                          onChanged: (value) {
                            debugPrint("is time ${value.inSeconds}");
                            if(value.inSeconds <= 0){
                              setState(() {
                                isExpired = true;
                              });
                            }
                            debugPrint("is time $isExpired");
                          },
                          onDone: () {
                            
                          },
                        ),
                      ],
                    ),
                    Text(
                      state.payment?.status == "WAITING_FOR_PAYMENT" ? "Menunggu Pembayaran" : state.payment?.status == "expire" ? "Pembayaran Kedaluwarsa" : "Pembayaran Berhasil",
                      style: TextStyle(
                        fontSize: 16,
                        color: state.payment?.status == "WAITING_FOR_PAYMENT" || state.payment?.status == "expire"  ? Colors.red : greenColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Metode Pembayaran",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ImageCard(
                            image: state.payment?.paymentLogo ?? "-", 
                            radius: 20,
                            width: 30,
                            height: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            state.payment?.paymentName ?? "-",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    state.payment?.status == "WAITING_FOR_PAYMENT" ? const Text(
                      "Batas akhir pembayaran",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ) :  Container(),
                    state.payment?.status == "WAITING_FOR_PAYMENT" ? Text(
                      DateFormat().format(
                        DateTime.parse(state.payment!.createdAt!).add(
                          state.payment?.paymentMethod == "GOPAY" ? const Duration(
                            days: 1,
                          ) : const Duration(
                            minutes: 15,
                          ),
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ) : Container(),
                    state.payment?.status == "PAID" ? const PagePaymentStatus(
                      msg: "Terima kasih anda sudah melakukan pembayaran pendaftaran siswa baru di Metro Hotel School",
                      img: completedSuccessfully,
                    ) : isExpired ? const PagePaymentStatus(
                      msg: "Mohon Maaf, Pembayaran anda sudah kedaluwarsa",
                      img: failedPayment,
                    ) : state.payment?.paymentMethod == 'VIRTUAL_ACCOUNT' ?
                    VirtualAccountMethodWidget(
                      payment: state.payment!,
                    ) : QrMethodWidget(payment: state.payment!),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      ),
                      onPressed: (){
                        Navigator.of(context).pop();
                      }, 
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.home,
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Kembali ke Home"
                            )
                          ],
                        ),
                      )
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
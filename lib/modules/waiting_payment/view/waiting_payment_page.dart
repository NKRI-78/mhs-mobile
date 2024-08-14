import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/waiting_payment/cubit/waiting_payment_cubit.dart';
import 'package:mhs_mobile/modules/waiting_payment/widgets/virtual_account_method_widget.dart';

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

class WaitingPaymentView extends StatelessWidget {
  const WaitingPaymentView({super.key});

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
          return SizedBox.expand(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
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
                    const Text(
                      'Menunggu Pemayaran',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Batas akhir pembayaran",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      DateFormat().format(
                        DateTime.parse(state.payment!.createdAt!).add(
                          const Duration(
                            days: 1,
                          ),
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    if (state.payment?.paymentMethod == 'VIRTUAL_ACCOUNT')
                      VirtualAccountMethodWidget(
                        payment: state.payment!,
                      ),
                    const Divider(
                      color: Colors.grey,
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

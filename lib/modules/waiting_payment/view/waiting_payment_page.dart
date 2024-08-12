import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/modules/waiting_payment/cubit/waiting_payment_cubit.dart';

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
        title: const Text("Pembayaran"),
      ),
      body: const Column(
        children: [
          Text("Status"),
        ],
      ),
    );
  }
}

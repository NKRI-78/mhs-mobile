// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import 'package:mhs_mobile/modules/new_student/models/new_student_model.dart';
import 'package:mhs_mobile/modules/new_student_payment/cubit/new_student_payment_cubit.dart';
import 'package:mhs_mobile/modules/new_student_payment/widgets/select_payment_channel.dart';

class NewStudentPaymentPage extends StatelessWidget {
  const NewStudentPaymentPage({
    super.key,
    required this.student,
  });
  final NewStudentModel student;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewStudentPaymentCubit>(
      create: (context) =>
          NewStudentPaymentCubit(student: student)..getPaymentChannel(),
      child: const NewStudentPaymentView(),
    );
  }
}

class NewStudentPaymentView extends StatelessWidget {
  const NewStudentPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pembayaran"),
      ),
      body: SizedBox.expand(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(1, 1),
                      blurRadius: 3,
                      spreadRadius: 1,
                      color: Colors.black.withOpacity(.2)),
                ],
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: const Row(
                children: [
                  Icon(
                    Iconsax.wallet,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text("Total "),
                  Spacer(),
                  Text(
                    "Rp 200.000",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            BlocBuilder<NewStudentPaymentCubit, NewStudentPaymentState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) =>
                            BlocProvider<NewStudentPaymentCubit>.value(
                          value: context.read<NewStudentPaymentCubit>(),
                          child: const SelectPaymentChannel(),
                        ),
                      );
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black.withOpacity(.3),
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          const Icon(
                            Iconsax.bank,
                          ),
                          Expanded(
                            child: Text(
                              state.channel != null
                                  ? state.channel?.name ?? ""
                                  : 'Pilih metode pembayaran',
                              textAlign: TextAlign.end,
                              maxLines: 1,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const Icon(Iconsax.arrow_circle_right)
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            BlocBuilder<NewStudentPaymentCubit, NewStudentPaymentState>(
              builder: (context, state) {
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: state.loading
                        ? null
                        : () async {
                            var cubit = context.read<NewStudentPaymentCubit>();
                            if (state.channel == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Silahkan pilih metode pembayaran"),
                                ),
                              );
                            } else {
                              try {
                                await cubit.checkout();
                              } catch (e) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(e.toString()),
                                    ),
                                  );
                                }
                              }
                            }
                          },
                    child: const Text('Checkout'),
                  ),
                );
              },
            )
          ],
        ),
      )),
    );
  }
}

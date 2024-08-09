import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mhs_mobile/modules/new_student_payment/cubit/new_student_payment_cubit.dart';

class SelectPaymentChannel extends StatelessWidget {
  const SelectPaymentChannel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewStudentPaymentCubit, NewStudentPaymentState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          children: state.channels
              .map(
                (e) => ListTile(
                  title: Text(e.name ?? ""),
                  onTap: () {
                    context.read<NewStudentPaymentCubit>().setPaymentChannel(e);
                    Navigator.pop(context);
                  },
                  subtitle: Text(
                    (e.paymentType ?? "").replaceAll(
                      "_",
                      " ",
                    ),
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  trailing: const Icon(Iconsax.arrow_right),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

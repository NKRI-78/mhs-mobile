import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/new_student_payment/cubit/new_student_payment_cubit.dart';
import 'package:mhs_mobile/widgets/images/image_card.dart';

class SelectPaymentChannel extends StatelessWidget {
  const SelectPaymentChannel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewStudentPaymentCubit, NewStudentPaymentState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          children: state.channels
              .map(
                (e) => ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  title: Text(e.name ?? ""),
                  onTap: () {
                    context.read<NewStudentPaymentCubit>().setPaymentChannel(e);
                    Navigator.pop(context);
                  },
                  selected: true,
                  selectedColor: primaryColor,
                  splashColor: primaryColor,
                  leading: ImageCard(
                    image: e.logo ?? "", 
                    height: 40,
                    width: 50,
                    radius: 10
                  ),
                  subtitle: Text(
                    (e.paymentType ?? "").replaceAll(
                      "_",
                      " ",
                    ).replaceAll("GOPAY", "QRIS"),
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

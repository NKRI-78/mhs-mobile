// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';

import 'package:mhs_mobile/modules/new_student/models/new_student_model.dart';
import 'package:mhs_mobile/modules/new_student_payment/cubit/new_student_payment_cubit.dart';
import 'package:mhs_mobile/modules/new_student_payment/widgets/select_payment_channel.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';

class NewStudentPaymentPage extends StatelessWidget {
  const NewStudentPaymentPage({
    super.key,
    required this.student,
  });
  final NewStudentModel student;

  @override
  Widget build(BuildContext context) {
    debugPrint("Ukuran baju : ${student.outfitSize}");
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
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          CustomScrollView(
            shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  const HeaderSection(
                    title: "Pembayaran", 
                    isCircle: true,
                    isPrimary: false,
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                    sliver : SliverList(
                      delegate: SliverChildListDelegate([
                        Container(
                          width: double.infinity,
                          height: 175,
                          decoration: BoxDecoration(
                            color: greyColor, 
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: fontSizeLarge
                                ),
                              ),
                              Text(
                                "Rp. 200.000",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: fontSizeOverLarge
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
                            return InkWell(
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
                                    Expanded(
                                      child: Text(
                                        state.channel != null
                                            ? state.channel?.name ?? ""
                                            : 'Pilih metode pembayaran',
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    const Icon(Icons.keyboard_arrow_down)
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ]),
                    ),
                  )
                ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BlocBuilder<NewStudentPaymentCubit, NewStudentPaymentState>(
                builder: (context, state) {
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                                  var paymentNumber = await cubit.checkout();
                                  debugPrint("Number : $paymentNumber");
                                  if (context.mounted) {
                                    WaitingPaymentRoute(id: paymentNumber)
                                        .go(context);
                                  }
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
              ),
          )
        ],
      ),
    );
  }
}

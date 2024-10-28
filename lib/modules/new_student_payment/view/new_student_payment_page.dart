// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/modal.dart';
import 'package:mhs_mobile/misc/theme.dart';

import 'package:mhs_mobile/modules/new_student/models/new_student_model.dart';
import 'package:mhs_mobile/modules/new_student_payment/cubit/new_student_payment_cubit.dart';
import 'package:mhs_mobile/modules/new_student_payment/widgets/select_payment_channel.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/extension/snackbar.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';
import 'package:mhs_mobile/widgets/images/image_card.dart';

class NewStudentPaymentPage extends StatelessWidget {
  const NewStudentPaymentPage({
    super.key,
    required this.student,
  });
  final NewStudentModel student;

  @override
  Widget build(BuildContext context) {
    debugPrint("Ukuran baju : ${student.birthDate}");
    debugPrint("Gender : ${student.gender}");
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
                          height: 150,
                          decoration: BoxDecoration(
                            color: greyColor, 
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(20),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Total Pembayaran",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: fontSizeLarge
                                ),
                              ),
                              SizedBox(
                                height: 10,
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
                                    state.channel?.logo == null ? 
                                    const Icon(
                                      Icons.account_balance,
                                      size: 50,
                                    ) :
                                    ImageCard(
                                      image: state.channel?.logo ?? "", 
                                      height: 50,
                                      width: 50,
                                      radius: 10
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
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
                                ShowSnackbar.snackbar(context, "Silahkan pilih metode pembayaran", '', errorColor);
                              } else {
                                try {
                                  var paymentNumber = await cubit.checkout();
                                  if (context.mounted) {
                                    WaitingPaymentRoute(id: paymentNumber)
                                        .go(context);
                                  }
                                } catch (e) {
                                  if (context.mounted) {
                                    ShowSnackbar.snackbar(context, e.toString(), '', errorColor);
                                  }
                                }
                              }
                            },
                      child: const Text('Bayar'),
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

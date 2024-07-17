import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:flutter/services.dart';
import 'package:mhs_mobile/modules/register_otp/cubit/register_otp_cubit.dart';

class ChangeEmailBottomsheetWidget extends StatelessWidget {
  final Size screenSize;
  final ScrollController scrollC;

  const ChangeEmailBottomsheetWidget(
      {super.key,
      required this.screenSize,
      required this.scrollC});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<RegisterOtpCubit>(),
      child: Container(
      decoration: BoxDecoration(
        color: whiteColor.withOpacity(0.09),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.6),
            blurRadius: 20.0,
          )
        ],
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  context.read<RegisterOtpCubit>().chageEmailOtp(context);
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: fontSizeLarge,
                      ),
                    ),
                  ),
                ),
              ),
              BlocBuilder<RegisterOtpCubit, RegisterOtpState>(
                buildWhen: (previous, current) => previous.newEmail != current.newEmail,
                builder: (context, state) {
                  return TextField(
                    onChanged: (value) {
                      var cubit = context.read<RegisterOtpCubit>();
                        cubit.copyState(newState: cubit.state.copyWith(newEmail: value));
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter,
                    ],
                    style: const TextStyle(
                      fontSize: fontSizeLarge,
                    ),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: whiteColor.withOpacity(0.5),
                        prefixIcon: const Icon(
                          Icons.email,
                          color: greyInputColor,
                          size: fontSizeDefault,
                        ),
                        hintText: 'Example: user@mail.com',
                        hintStyle: const TextStyle(
                          fontSize: fontSizeLarge,
                          color: greyInputColor,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                color: Colors.transparent))),
                  );
                }
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "",
                  style: TextStyle(
                    color: redColor,
                  ),
                ),
              )
            ],
          ),
      ),
    ));
  }
}

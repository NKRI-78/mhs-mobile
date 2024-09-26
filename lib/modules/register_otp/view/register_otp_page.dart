import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:mhs_mobile/modules/register_otp/cubit/register_otp_cubit.dart';
import 'package:mhs_mobile/widgets/background/custom_background_scaffold.dart';

class RegisterOtpPage extends StatelessWidget {
  final String email;
  const RegisterOtpPage({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterOtpCubit>(
        create: (context) => RegisterOtpCubit()..init(email),
        child: const RegisterOtpView());
  }
}

class RegisterOtpView extends StatefulWidget {
  const RegisterOtpView({
    super.key,
  });
  @override
  State<RegisterOtpView> createState() => _RegisterOtpViewState();
}

class _RegisterOtpViewState extends State<RegisterOtpView> {
  bool _startTimer = false;

  final StopWatchTimer _timer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    presetMillisecond: StopWatchTimer.getMilliSecFromSecond(40),
  );

  String _parseSeconds(int value) {
    value++;
    if (value > 1) {
      return "Kirim ulang lagi dalam $value detik";
    }
    return "Kirim ulang lagi dalam $value detik";
  }

  @override
  void initState() {
    super.initState();

    _timer.fetchEnded.listen((value) {
      _startTimer = false;
      _timer.onResetTimer();
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();

    _timer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (!didPop) {
          LoginRoute().go(context);
        }
      },
      child: BlocBuilder<RegisterOtpCubit, RegisterOtpState>(
        builder: (context, state) {
          return CustomBackgroundScaffold(
              assets: BackgroundAssets.standart,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  slivers: [
                    const SliverAppBar(
                      backgroundColor: Colors.transparent,
                      title: Text(
                        "Kode OTP",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSizeOverLarge,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      automaticallyImplyLeading: false,
                      centerTitle: true,
                    ),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          const Text(
                            'Kami telah mengirimkan OTP ke email ',
                            style: TextStyle(
                              fontSize: fontSizeDefault,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            state.email,
                            style: const TextStyle(
                              fontSize: fontSizeDefault,
                              fontWeight: FontWeight.bold,
                              color: redColor
                            ),
                          ),
                          const Text(
                            " Masukan Kode OTP pada kolom yang tersedia",
                            style: TextStyle(
                              fontSize: fontSizeDefault,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BlocBuilder<RegisterOtpCubit, RegisterOtpState>(
                              builder: (context, state) {
                            return OtpTextField(
                              fieldWidth: 55,
                              fieldHeight: 55,
                              numberOfFields: 4,
                              borderColor: const Color(0xFF512DA8),
                              //set to true to show as box or false to show as dash
                              showFieldAsBox: true,
                              //runs when a code is typed in
                              onCodeChanged: (String code) {
                                context.read<RegisterOtpCubit>().copyState(
                                    newState: context
                                        .read<RegisterOtpCubit>()
                                        .state
                                        .copyWith(otp: code));
                              },
                              //runs when every textfield is filled
                              onSubmit: (String verificationCode) {
                                if (state.loading) {
                                  return;
                                }
                                context
                                    .read<RegisterOtpCubit>()
                                    .submit(verificationCode, context);
                              }, // end onSubmit
                            );
                          }),
                          const SizedBox(
                            height: 16,
                          ),
                          _startTimer
                              ? StreamBuilder<int>(
                                  stream: _timer.secondTime,
                                  initialData: _timer.initialPresetTime,
                                  builder: (context, snap) {
                                    final value = snap.data ?? 0;
                                    return Text(
                                      _parseSeconds(value),
                                      style: const TextStyle(color: whiteColor),
                                    );
                                  })
                              : RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: 'klik disini',
                                      style: const TextStyle(
                                        color: redColor,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          context.read<RegisterOtpCubit>().resendOtp(context);
                                          _startTimer = true;
                                          _timer.onStartTimer();
                                          setState(() {});
                                        },
                                    ),
                                    const TextSpan(
                                        text:
                                            " apabila belum mendapatkan Kode OTP"),
                                  ]),
                                ),
                          const SizedBox(
                            height: 250,
                          ),
                          // BlocBuilder<RegisterOtpCubit, RegisterOtpState>(
                          //     builder: (context, state) {
                          //   return Align(
                          //     alignment: Alignment.bottomCenter,
                          //     child: Column(
                          //       mainAxisAlignment: MainAxisAlignment.start,
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         SizedBox(
                          //           width: double.infinity,
                          //           height: 47,
                          //           child: ElevatedButton(
                          //             onPressed: () {},
                          //             child: const Text(
                          //               'Ubah Email',
                          //             ),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   );
                          // }),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      )
                    ]))
                  ],
                ),
              ));
        },
      ),
    );
  }
}

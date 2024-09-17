import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/forgot_password_otp/cubit/forgot_password_otp_cubit.dart';
import 'package:mhs_mobile/modules/forgot_password_otp/cubit/forgot_password_otp_state.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/background/custom_background_scaffold.dart';
import 'package:mhs_mobile/widgets/textfield/textfield.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

part '../widgets/_button_submit.dart';
part '../widgets/_field_email.dart';

final GlobalKey<FormState> _formForgot = GlobalKey<FormState>();

class ForgotPasswordOtpPage extends StatelessWidget {
  const ForgotPasswordOtpPage({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    debugPrint("Email : $email");
    return BlocProvider<ForgotPasswordOtpCubit>(
      create: (context) => ForgotPasswordOtpCubit()..init(email),
      child: const ForgotPasswordOtpView() 
    );
  }
}

class ForgotPasswordOtpView extends StatefulWidget {
  const ForgotPasswordOtpView({super.key});

  @override
  State<ForgotPasswordOtpView> createState() => _ForgotPasswordOtpViewState();
}

class _ForgotPasswordOtpViewState extends State<ForgotPasswordOtpView> {
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
      child: BlocBuilder<ForgotPasswordOtpCubit, ForgotPasswordOtpState>(
        builder: (context, state) {
        return CustomBackgroundScaffold(
          assets: BackgroundAssets.standart,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          onTap: () {
                            GoRouter.of(context).pop();
                          },
                          child: Image.asset(
                            backIcon,
                            width: 42,
                            height: 42,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Image.asset(
                        logoMhs,
                        width: 182,
                        height: 182,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
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
                BlocBuilder<ForgotPasswordOtpCubit, ForgotPasswordOtpState>(
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
                      context.read<ForgotPasswordOtpCubit>().copyState(
                          newState: context.read<ForgotPasswordOtpCubit>().state.copyWith(otp: code));
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      if (state.loading) {
                        return;
                      }
                      context.read<ForgotPasswordOtpCubit>().submit(context, verificationCode);
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
                          context.read<ForgotPasswordOtpCubit>().forgotPasswordSendOTP(context);
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
              ],
            ),
          ));
        },
      ),
    );
  }
}
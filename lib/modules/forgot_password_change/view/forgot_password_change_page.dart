import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/forgot_password_change/cubit/forgot_password_change_cubit.dart';
import 'package:mhs_mobile/modules/forgot_password_change/cubit/forgot_password_change_state.dart';
import 'package:mhs_mobile/widgets/background/custom_background_scaffold.dart';
import 'package:mhs_mobile/widgets/textfield/textfield.dart';

part '../widgets/_button_submit.dart';
part '../widgets/_field_password.dart';
part '../widgets/_field_password_confirm.dart';


final GlobalKey<FormState> _formForgot = GlobalKey<FormState>();

class ForgotPasswordChangePage extends StatelessWidget {
  const ForgotPasswordChangePage({super.key, required this.email, required this.otp});

  final String email;
  final String otp;

  @override
  Widget build(BuildContext context) {
    debugPrint("otp : $otp");
    return BlocProvider<ForgotPasswordChangeCubit>(
      create: (context) => ForgotPasswordChangeCubit(email: email, otp: otp),
      child:  const ForgotPasswordChangeView()
    );
  }
}

class ForgotPasswordChangeView extends StatelessWidget {
  const ForgotPasswordChangeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundScaffold(
      assets: BackgroundAssets.welcome,
      child: Form(
        key: _formForgot,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ubah Password',
                    style: TextStyle(
                      fontSize: fontSizeOverLarge,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Masukkan password baru.',
                    style: TextStyle(
                      fontSize: fontSizeDefault,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  _FieldPassword(),
                  SizedBox(
                    height: 16,
                  ),
                  _FieldPasswordConfirm(),
                  SizedBox(
                    height: 16,
                  ),
                  _ButtonSubmit(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
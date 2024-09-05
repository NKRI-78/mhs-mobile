import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/register/cubit/register_cubit.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/background/custom_background_scaffold.dart';
import 'package:mhs_mobile/widgets/textfield/textfield.dart';

part '../widgets/_bottom_button.dart';
part '../widgets/_input_student_name.dart';
part '../widgets/_input_phone.dart';
part '../widgets/_input_email.dart';
part '../widgets/_field_password.dart';
part '../widgets/_field_confirm_password.dart';

final GlobalKey<FormState> _formRegister = GlobalKey<FormState>();

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterCubit(), child: const RegisterView());
  }
}

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundScaffold(
        assets: BackgroundAssets.standart,
        child: Form(
          key: _formRegister,
          child: CustomScrollView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                leading: InkWell(
                    onTap: () {
                      if (GoRouter.of(context).canPop()) {
                        GoRouter.of(context).pop();
                      }
                    },
                    child: Image.asset("assets/icons/back-icon.png")),
                title: const Text(
                  "Daftar Akun",
                  style: TextStyle(fontSize: fontSizeTitle),
                ),
                centerTitle: true,
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const _InputStudentName(),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: _InputPhone(),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: _InputEmail(),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: _FieldPassword(),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: _FieldConfirmPassword(),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: _BottomButon(),
                      ),
                      RichText(
                            
                        text: TextSpan(
                          children: [
                            const TextSpan(text: "Sudah Punya Akun ? "),
                            TextSpan(
                              text: "Masuk",
                              style: const TextStyle(
                                color: redColor,
                              ),
                              recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                LoginRoute().go(context);
                              },
                            ),
                          ]
                        )
                      )
                    ],
                  ),
                )
              ]))
            ],
          ),
        ));
  }
}

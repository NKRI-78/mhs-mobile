import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/login/cubit/login_cubit.dart';
import 'package:mhs_mobile/widgets/background/custom_background_scaffold.dart';
import 'package:mhs_mobile/widgets/textfield/textfield.dart';

part '../widgets/_input_fullname.dart';
part '../widgets/_input_nis.dart';
part '../widgets/_bottom_button.dart';
part '../widgets/_field_password.dart';

final GlobalKey<FormState> _formLogin = GlobalKey<FormState>();


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundScaffold(
      assets: BackgroundAssets.welcome,
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formLogin,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.w600,
                    fontSize: fontSizeOverLarge
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: _InputFullname(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: _FieldPassword(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: _BottomButon(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

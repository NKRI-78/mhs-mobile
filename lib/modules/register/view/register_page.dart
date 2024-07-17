import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mhs_mobile/misc/theme.dart';
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
    return const RegisterView();
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomScrollView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              SliverAppBar(
                toolbarHeight: 50,
                backgroundColor: Colors.transparent,
                leading: InkWell(
                onTap: () {
                  GoRouter.of(context).pop();
                },
                child: Image.asset("assets/icons/back-icon.png")),
                title: const Text(
                  "Regist Account",
                  style: TextStyle(
                    fontSize: fontSizeTitle
                  ),
                ),
                centerTitle: true,
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    _InputStudentName(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: _InputPhone(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: _InputEmail(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: _FieldPassword(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: _FieldConfirmPassword(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: _BottomButon(),
                    ),
                  ],
                )
              ]))
            ],
          ),
        ),
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/change_password/cubit/change_password_cubit.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';
import 'package:mhs_mobile/widgets/textfield/textfield.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangePasswordCubit>(
        create: (context) => ChangePasswordCubit(),
        child: const ChangePasswordView());
  }
}

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          const HeaderSection(
            title: "Ubah Password", 
            isCircle: true
          ),
           SliverPadding(
             padding: const EdgeInsets.all(10.0),
             sliver: SliverList(
              delegate: SliverChildListDelegate([
                CustomTextField(
                  onChanged: (value) {
                    context.read<ChangePasswordCubit>()
                    .passwordStateEmit(value);
                  },
                  labelText: 'Kata Sandi Baru',
                  isPassword: true,
                  hintText: "",
                  emptyText: "Masukkan password",
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 18,
                ),
                CustomTextField(
                  onChanged: (value) {
                    context.read<ChangePasswordCubit>().confirmPasswordStateEmit(value);
                  },
                  labelText: 'Konfirmasi Kata Sandi Baru',
                  isPassword: true,
                  hintText: "",
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                ),
              ])
            ),
           )
        ],
      ),
    );
  }
}

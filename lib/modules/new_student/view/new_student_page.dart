import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/choose_role/cubit/choose_role_cubit.dart';
import 'package:mhs_mobile/modules/new_student/cubit/new_student_cubit.dart';
import 'package:mhs_mobile/modules/new_student/models/gender_model.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/background/custom_background_scaffold.dart';
import 'package:mhs_mobile/widgets/extension/date_util.dart';
import 'package:mhs_mobile/widgets/textfield/textfield.dart';

part '../widgets/_input_student_name.dart';
part '../widgets/_input_birthday.dart';
part '../widgets/_input_school_from.dart';
part '../widgets/_input_parent_name.dart';
part '../widgets/_input_number_phone_student.dart';
part '../widgets/_input_number_phone_parent.dart';
part '../widgets/_input_clothes_size.dart';
part '../widgets/_input_height.dart';
part '../widgets/_bottom_button.dart';
part '../widgets/_input_gender.dart';

final GlobalKey<FormState> _formRegister = GlobalKey<FormState>();

class NewStudentPage extends StatelessWidget {
  const NewStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChooseRoleCubit>(
          create: (BuildContext context) => ChooseRoleCubit()..fetchGeneration(),
        ),
        BlocProvider<NewStudentCubit>(
          create: (BuildContext context) => NewStudentCubit(),
        ),
      ], child: const NewStudentView(),
    );
  }
}

class NewStudentView extends StatelessWidget {
  const NewStudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChooseRoleCubit, ChooseRoleState>(
      buildWhen: (previous, current) => previous.generation != current.generation,
      builder: (context, state) {
        return CustomBackgroundScaffold(
            assets: BackgroundAssets.standart,
            child: Form(
              key: _formRegister,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomScrollView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
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
                        "Siswa Baru",
                        style: TextStyle(fontSize: fontSizeTitle),
                      ),
                      centerTitle: true,
                    ),
                    SliverList(
                        delegate: SliverChildListDelegate([
                       Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 35,
                          ),
                          const _InputStudentName(),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: _InputBirthday(),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: _InputSchoolFrom(),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: _InputGender(),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: _InputParentName(),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: _InputNumberPhoneStudent(),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: _InputNumberPhoneParent(),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _InputClothesSize(),
                              Flexible(child: SizedBox()),
                              _InputHeight(),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Disclaimer !",
                                style: TextStyle(
                                  color: whiteColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: fontSizeOverLarge,
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Text(
                              "Biaya Formulir Pendaftaran sebesar Rp 200.000 dapat di Bayarkan menggunakan metode pembayaran yang sudah kami sediakan",
                              style: TextStyle(
                                color: whiteColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              "*Persyaratan lain dapat menyusul pada saat tahun ajaran baru ${state.generation?.data?.schoolGeneration?.years?? "-"} TA Baru dimulai Tahun  ${state.generation?.data?.schoolGeneration?.years?? "-"}",
                              style: const TextStyle(
                                color: whiteColor,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: _BottomButon(),
                          ),
                        ],
                      )
                    ]))
                  ],
                ),
              ),
            ));
      }
    );
  }
}

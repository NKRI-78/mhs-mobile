import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/widgets/background/custom_background_scaffold.dart';
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


final GlobalKey<FormState> _formRegister = GlobalKey<FormState>();

class NewStudentPage extends StatelessWidget {
  const NewStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const NewStudentView();
  }
}

class NewStudentView extends StatelessWidget {
  const NewStudentView({super.key});

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
                  "New Student",
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
                      height: 35,
                    ),
                    _InputStudentName(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: _InputBirthday(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: _InputSchoolFrom(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: _InputParentName(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: _InputNumberPhoneStudent(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: _InputNumberPhoneParent(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _InputClothesSize(),
                        Flexible(child: SizedBox()),
                        _InputHeight(),
                      ],
                    ),
                    Padding(
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
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        "Biaya Formulir Pendaftaran sebesar Rp 200.000 dapat di Bayarkan melalui VA yang akan keluar ketika melanjutkan ke Pembayaran.",
                        style: TextStyle(
                          color: whiteColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "(Kirim bukti pembayaran via Whatsapp)",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        "*Persyaratan lain dapat menyusul pada saat tahun ajaran baru 2025 TA Baru dimulai Bulan Juni 2025",
                        style: TextStyle(
                          color: whiteColor,
                        ),
                      ),
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

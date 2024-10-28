import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/settings/widgets/list_setting.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: CustomScrollView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        slivers: [
          const HeaderSection(
            title: "Pengaturan", 
            isCircle: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ListSetting(
                    title: 'Ubah Kata Sandi', 
                    onTap: () { 
                      // ChangePasswordRoute().go(context);
                  },),
                ),
              ])
            ),
          ),
        ],
      ),
    );
  }
}
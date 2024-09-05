import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/choose_role/cubit/choose_role_cubit.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/background/custom_background_scaffold.dart';

part '../widgets/_input_role.dart';

class ChooseRolePage extends StatelessWidget {
  const ChooseRolePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChooseRoleCubit>(
      create: (context) => ChooseRoleCubit(),
      child: const ChooseRoleView(),
    );
  }
}

class ChooseRoleView extends StatelessWidget {
  const ChooseRoleView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChooseRoleCubit, ChooseRoleState>(
      builder: (context, st) {
        return CustomBackgroundScaffold(
          assets: BackgroundAssets.welcome,
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
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
                  height: 150,
                ),
                const _SelectRoleWidgets(),
                SizedBox(
                  width: double.infinity,
                  height: 47,
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint("Slect : ${st.roleSelect}");
                      if(st.roleSelect == "Siswa"){
                        LoginStudentRoute().go(context);
                      } else if(st.roleSelect == "Parent"){
                        LoginParentRoute().go(context);
                      }
                      // LoginRoute().push(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: whiteColor
                    ),
                    child: const Text(
                      'Lanjut',
                      style: TextStyle(
                        color: primaryColor
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Divider(
                          color: whiteColor.withOpacity(0.4),
                          thickness: 1,
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Text(
                          "Atau",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Divider(
                          color: whiteColor.withOpacity(0.4),
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 47,
                  child: ElevatedButton(
                    onPressed: () {
                      NewStudentRoute().push(context);
                    },
                    child: const Text(
                      'Siswa Baru',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}

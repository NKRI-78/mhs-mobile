import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/app/bloc/app_bloc.dart';
import 'package:mhs_mobile/modules/home/bloc/home_bloc.dart';
import 'package:mhs_mobile/modules/home/widgets/banners_widget.dart';
import 'package:mhs_mobile/modules/home/widgets/menus_widget.dart';
import 'package:mhs_mobile/modules/home/widgets/news_widget.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/background/background_home_scafold.dart';

part '../widgets/header_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc()..add(HomeInitialData()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        bool isLogin = state.isLogin;
        return BackgroundHomeScafold(
            child: ListView(children: [
          const HeaderHome(),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 36, bottom: 16),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(20),
                        topEnd: Radius.circular(20)),
                    color: whiteColor),
                child: DefaultTextStyle(
                  style: const TextStyle(color: Colors.black),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: const [
                      BannersWidget(),
                      MenusWidget(),
                      NewsWidget(),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -30,
                left: 20,
                right: 20,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: isLogin
                      ? ElevatedButton(
                          onPressed: () {
                            ChooseRoleRoute().go(context);
                          },
                          child: const Text('Choose your’e Account for'))
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  RegisterRoute().go(context);
                                },
                                child: const Text("Gabung Bersama Kami")),
                            ElevatedButton(
                                onPressed: () {},
                                child: const Icon(Iconsax.element_3))
                          ],
                        ),
                ),
              )
            ],
          )
        ]));
      },
    );
  }
}

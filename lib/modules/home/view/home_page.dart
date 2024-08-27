import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/app/bloc/app_bloc.dart';
import 'package:mhs_mobile/modules/home/bloc/home_bloc.dart';
import 'package:mhs_mobile/modules/home/widgets/body_home.dart';
import 'package:mhs_mobile/modules/home/widgets/menu_screen_home.dart';

part '../widgets/header_home.dart';

final ZoomDrawerController z = ZoomDrawerController();

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
    return ZoomDrawer(
        boxShadow: const [
          BoxShadow(
            color: blackColor,
            blurRadius: 50,
          )
        ],
        controller: z,
        isRtl: true,
        borderRadius: 50.0,
        angle: -7.0,
        mainScreenScale: 0.1,
        openCurve: Curves.easeIn,
        closeCurve: Curves.easeInOut,
        slideWidth: MediaQuery.of(context).size.width * 0.8,
        style: DrawerStyle.defaultStyle,
        menuBackgroundColor: primaryColor,
        menuScreen: const MenuScreenHome(),
        mainScreen: const BodyHome());
  }
}

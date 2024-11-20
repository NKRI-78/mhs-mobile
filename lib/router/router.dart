import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mhs_mobile/modules/app/bloc/app_bloc.dart';
import 'package:mhs_mobile/router/builder.dart';

const GlobalObjectKey<NavigatorState> myNavigatorKey = GlobalObjectKey<NavigatorState>("myNavigator");


class MyRouter {
  static GoRouter init(AppBloc app) => GoRouter(
    routes: $appRoutes,
    navigatorKey: myNavigatorKey,
    initialLocation: SplashScreenRoute().location,
  );
}

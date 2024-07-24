import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mhs_mobile/modules/begining_tour/view/begining_tour_page.dart';
import 'package:mhs_mobile/modules/choose_role/view/choose_role_page.dart';
import 'package:mhs_mobile/modules/home/view/home_page.dart';
import 'package:mhs_mobile/modules/login/views/login_page.dart';
import 'package:mhs_mobile/modules/new_student/view/new_student_page.dart';
import 'package:mhs_mobile/modules/register/view/register_page.dart';
import 'package:mhs_mobile/modules/register_otp/view/register_otp_page.dart';
import 'package:mhs_mobile/modules/splash_screen/views/splash_screen.dart';
part 'builder.g.dart';

@TypedGoRoute<BeginingTourRoute>(path: '/begining')
class BeginingTourRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BeginingTourPage();
  }
}

class RegisterRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RegisterPage();
  }
}

class RegisterOtpRoute extends GoRouteData {
  final String email;

  RegisterOtpRoute({required this.email});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return RegisterOtpPage(
      email: email,
    );
  }
}

class LoginRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

@TypedGoRoute<SplashScreenRoute>(path: '/splash')
class SplashScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashScreenPage();
  }
}

class ChooseRoleRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ChooseRolePage();
  }
}

class NewStudentRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NewStudentPage();
  }
}

@TypedGoRoute<HomeRoute>(path: '/', routes: [
  TypedGoRoute<RegisterRoute>(path: 'register', routes: [
    TypedGoRoute<RegisterOtpRoute>(
      path: 'register-otp',
    ),
    TypedGoRoute<LoginRoute>(
      path: 'login',
    ),
    TypedGoRoute<ChooseRoleRoute>(path: 'choose-role'),
    TypedGoRoute<NewStudentRoute>(path: 'new-student'),
  ])
])
class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

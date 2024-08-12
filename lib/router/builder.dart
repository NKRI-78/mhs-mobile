import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mhs_mobile/modules/begining_tour/view/begining_tour_page.dart';
import 'package:mhs_mobile/modules/choose_role/view/choose_role_page.dart';
import 'package:mhs_mobile/modules/home/view/home_page.dart';
import 'package:mhs_mobile/modules/login/views/login_page.dart';
import 'package:mhs_mobile/modules/new_student/models/new_student_model.dart';
import 'package:mhs_mobile/modules/new_student/view/new_student_page.dart';
import 'package:mhs_mobile/modules/new_student_payment/view/new_student_payment_page.dart';
import 'package:mhs_mobile/modules/register/view/register_page.dart';
import 'package:mhs_mobile/modules/register_otp/view/register_otp_page.dart';
import 'package:mhs_mobile/modules/splash_screen/views/splash_screen.dart';
import 'package:mhs_mobile/modules/waiting_payment/view/waiting_payment_page.dart';
part 'builder.g.dart';

@TypedGoRoute<BeginingTourRoute>(path: '/begining')
class BeginingTourRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BeginingTourPage();
  }
}

@TypedGoRoute<SplashScreenRoute>(path: '/splash')
class SplashScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashScreenPage();
  }
}

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<RegisterRoute>(path: 'register', routes: [
      TypedGoRoute<RegisterOtpRoute>(
        path: 'register-otp',
      ),
      TypedGoRoute<LoginRoute>(
        path: 'login',
      ),
    ]),
    TypedGoRoute<ChooseRoleRoute>(
      path: 'choose-role',
      routes: [
        TypedGoRoute<NewStudentRoute>(
          path: 'new-student',
          routes: [
            TypedGoRoute<NewStudentPaymentRoute>(path: 'payment'),
          ],
        ),
      ],
    ),
    TypedGoRoute<WaitingPaymentRoute>(path: 'waiting-payment')
  ],
)
class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
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

class NewStudentPaymentRoute extends GoRouteData {
  final String fullname;
  final String birthDate;
  final String originSchool;
  final String parentName;
  final String phone;
  final String parentPhone;
  final String outfitSize;
  final String height;

  NewStudentPaymentRoute(
      {required this.fullname,
      required this.birthDate,
      required this.originSchool,
      required this.parentName,
      required this.phone,
      required this.parentPhone,
      required this.outfitSize,
      required this.height});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return NewStudentPaymentPage(
      student: NewStudentModel(
          fullname: fullname,
          birthDate: birthDate,
          originSchool: originSchool,
          parentName: parentName,
          phone: phone,
          parentPhone: parentPhone,
          outfitSize: outfitSize,
          height: height),
    );
  }
}

class WaitingPaymentRoute extends GoRouteData {
  final String id;

  WaitingPaymentRoute({required this.id});
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return WaitingPaymentPage(
      id: id,
    );
  }
}

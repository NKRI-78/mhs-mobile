import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mhs_mobile/modules/begining_tour/view/begining_tour_page.dart';
import 'package:mhs_mobile/modules/choose_role/view/choose_role_page.dart';
import 'package:mhs_mobile/modules/detail_event/view/event_detail_page.dart';
import 'package:mhs_mobile/modules/event/view/event_page.dart';
import 'package:mhs_mobile/modules/home/view/home_page.dart';
import 'package:mhs_mobile/modules/list_brochure/view/list_brochure_page.dart';
import 'package:mhs_mobile/modules/list_modul/view/list_modul_page.dart';
import 'package:mhs_mobile/modules/list_presentation/view/list_presentation_page.dart';
import 'package:mhs_mobile/modules/login/views/login_page.dart';
import 'package:mhs_mobile/modules/media/view/media_page.dart';
import 'package:mhs_mobile/modules/new_student/models/new_student_model.dart';
import 'package:mhs_mobile/modules/new_student/view/new_student_page.dart';
import 'package:mhs_mobile/modules/new_student_payment/view/new_student_payment_page.dart';
import 'package:mhs_mobile/modules/news_detail/view/news_detail.dart';
import 'package:mhs_mobile/modules/partnership/view/partnership_page.dart';
import 'package:mhs_mobile/modules/profile/view/profile.dart';
import 'package:mhs_mobile/modules/register/view/register_page.dart';
import 'package:mhs_mobile/modules/register_otp/view/register_otp_page.dart';
import 'package:mhs_mobile/modules/show_more_news/view/show_more_news.dart';
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
    TypedGoRoute<NewsDetailRoute>(path: 'news-detail'),
    TypedGoRoute<ListPresentationRoute>(path: 'presentation'),
    TypedGoRoute<ListModulRoute>(path: 'modul'),
    TypedGoRoute<ListBrochureRoute>(path: 'brochure'),
    TypedGoRoute<PartnershipRoute>(path: 'partnership'),
    TypedGoRoute<ProfileRoute>(path: 'profile'),
    TypedGoRoute<ShowMoreNewsRoute>(path: 'show-more-news', routes: [
      TypedGoRoute<SMNewsDetailRoute>(path: 'sm-news-detail'),
    ]),
    TypedGoRoute<EventRoute>(path: 'event' , routes: [
      TypedGoRoute<EventDetailRoute>(path: 'event-detail'),
    ]),
    TypedGoRoute<MediaRoute>(path: 'media'),
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
class NewsDetailRoute extends GoRouteData {
  NewsDetailRoute({required this.newsId});

  final int newsId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return NewsDetailPage(newsId: newsId,);
  }
}
class SMNewsDetailRoute extends GoRouteData {
  SMNewsDetailRoute({required this.newsId});

  final int newsId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return NewsDetailPage(newsId: newsId,);
  }
}
class ListBrochureRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ListBrochurePage();
  }
}

class EventRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const EventPage();
  }
}

class ListPresentationRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ListPresentationPage();
  }
}

class ListModulRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ListModulPage();
  }
}
class MediaRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MediaPage();
  }
}

class PartnershipRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PartnershipPage();
  }
}

class ProfileRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfilePage();
  }
}

class ShowMoreNewsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ShowMoreNewsPage();
  }
}

class EventDetailRoute extends GoRouteData {
  final int idEvent;

  EventDetailRoute({required this.idEvent});
  
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return EventDetailPage(idEvent: idEvent,);
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

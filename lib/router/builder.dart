import 'package:flutter/material.dart';
import 'package:galleryimage/gallery_image_view_wrapper.dart';
import 'package:galleryimage/gallery_item_model.dart';
import 'package:go_router/go_router.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/absence/view/absence_page.dart';
import 'package:mhs_mobile/modules/add_testimoni/view/add_testimoni.dart';
import 'package:mhs_mobile/modules/begining_tour/view/begining_tour_page.dart';
import 'package:mhs_mobile/modules/change_password/view/change_password_page.dart';
import 'package:mhs_mobile/modules/choose_role/view/choose_role_page.dart';
import 'package:mhs_mobile/modules/connectivity/view/connectivity_page.dart';
import 'package:mhs_mobile/modules/detail_event/view/event_detail_page.dart';
import 'package:mhs_mobile/modules/detail_notification/view/detail_notification_page.dart';
import 'package:mhs_mobile/modules/detail_testimoni/view/detail_testimoni.dart';
import 'package:mhs_mobile/modules/event/view/event_page.dart';
import 'package:mhs_mobile/modules/forgot_password/view/forgot_password_page.dart';
import 'package:mhs_mobile/modules/forgot_password_change/view/forgot_password_change_page.dart';
import 'package:mhs_mobile/modules/forgot_password_otp/view/forgot_password_otp_page.dart';
import 'package:mhs_mobile/modules/grade/views/grade_page.dart';
import 'package:mhs_mobile/modules/home/view/home_page.dart';
import 'package:mhs_mobile/modules/list_brochure/view/fullscreen_brochure_page.dart';
import 'package:mhs_mobile/modules/list_brochure/view/list_brochure_page.dart';
import 'package:mhs_mobile/modules/list_modul/view/list_modul_page.dart';
import 'package:mhs_mobile/modules/list_presentation/view/fullscreen_presentation_page.dart';
import 'package:mhs_mobile/modules/list_presentation/view/list_presentation_page.dart';
import 'package:mhs_mobile/modules/login_alumni/views/login_alumni_page.dart';
import 'package:mhs_mobile/modules/login/views/login_page.dart';
import 'package:mhs_mobile/modules/login_parent/views/login_parent_page.dart';
import 'package:mhs_mobile/modules/login_student/views/login_student_page.dart';
import 'package:mhs_mobile/modules/media/view/media_page.dart';
import 'package:mhs_mobile/modules/new_student/models/new_student_model.dart';
import 'package:mhs_mobile/modules/new_student/view/new_student_page.dart';
import 'package:mhs_mobile/modules/new_student/widgets/contact/contact_parent.dart';
import 'package:mhs_mobile/modules/new_student/widgets/contact/contact_student.dart';
import 'package:mhs_mobile/modules/new_student_payment/view/new_student_payment_page.dart';
import 'package:mhs_mobile/modules/news_detail/view/news_detail.dart';
import 'package:mhs_mobile/modules/notification/view/notification_page.dart';
import 'package:mhs_mobile/modules/partnership/view/partnership_page.dart';
import 'package:mhs_mobile/modules/privacypolicy/view/privacy_page.dart';
import 'package:mhs_mobile/modules/profile/view/profile.dart';
import 'package:mhs_mobile/modules/register/view/register_page.dart';
import 'package:mhs_mobile/modules/register/widgets/contact.dart';
import 'package:mhs_mobile/modules/register_otp/view/register_otp_page.dart';
import 'package:mhs_mobile/modules/settings/view/settings_page.dart';
import 'package:mhs_mobile/modules/show_more_news/view/show_more_news.dart';
import 'package:mhs_mobile/modules/show_more_testimoni/view/show_more_testimoni.dart';
import 'package:mhs_mobile/modules/show_pdf/view/show_pdf.dart';
import 'package:mhs_mobile/modules/splash_screen/views/splash_screen.dart';
import 'package:mhs_mobile/modules/update/view/update_page.dart';
import 'package:mhs_mobile/modules/waiting_payment/view/waiting_payment_page.dart';
import 'package:mhs_mobile/modules/webview/view/webview.dart';
import 'package:mhs_mobile/repositories/home_repository/models/testimoni_model.dart';
import 'package:mhs_mobile/repositories/notification_repository/model/notificaiton_model.dart';
import 'package:mhs_mobile/widgets/pages/page_message_payment.dart';
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
    TypedGoRoute<PrivacyRoute>(path: 'privacy'),
    TypedGoRoute<NoConnectionRoute>(path: 'no-connection'),
    TypedGoRoute<GalleryImageViewWrapperRoute>(path: 'gallery-image'),
    TypedGoRoute<ListPresentationRoute>(path: 'presentation',routes: [
      TypedGoRoute<PresentationShowPdfRoute>(path: 'presentation-detail'),
      TypedGoRoute<FullScreenPresentationRoute>(path: 'presentation-fullscreen'),
    ]),
    TypedGoRoute<ListModulRoute>(path: 'modul',routes: [
      TypedGoRoute<ModulShowPdfRoute>(path: 'modul-detail'),
    ]),
    TypedGoRoute<ListBrochureRoute>(path: 'brochure' ,routes: [
      TypedGoRoute<BrochureShowPdfRoute>(path: 'brochure-detail'),
      TypedGoRoute<FullScreenBrochureRoute>(path: 'brochure-full-screen'),
    ]),
    TypedGoRoute<PartnershipRoute>(path: 'partnership'),
    TypedGoRoute<WebViewRoute>(path: 'webview'),
    TypedGoRoute<ProfileRoute>(path: 'profile'),
    TypedGoRoute<NotificationRoute>(path: 'notifikasi', routes: [
      TypedGoRoute<DetailNotifRoute>(path: 'detail-notifikasi'),
      TypedGoRoute<WaitingPaymentNotifRoute>(path: 'waiting-payment-notif'),
    ]),
    TypedGoRoute<ShowMoreTestimoniRoute>(path: 'show-more-testimoni', routes: [
      TypedGoRoute<DetailTestimoniRoute>(path: 'detail-testimoni'),
    ]),
    TypedGoRoute<AddTestimoniRoute>(path: 'add-testimoni'),
    TypedGoRoute<GradeRoute>(path: 'grade'),
    TypedGoRoute<ShowMoreNewsRoute>(path: 'show-more-news', routes: [
      TypedGoRoute<SMNewsDetailRoute>(path: 'sm-news-detail'),
    ]),
    TypedGoRoute<EventRoute>(path: 'event' , routes: [
      TypedGoRoute<EventDetailRoute>(path: 'event-detail'),
    ]),
    TypedGoRoute<SettingRoute>(path: "setting", routes: [
      TypedGoRoute<ChangePasswordRoute>(path: "change-password"),
    ]),
    TypedGoRoute<MediaRoute>(path: 'media'),
    TypedGoRoute<RegisterRoute>(path: 'register', routes: [
      TypedGoRoute<RegisterOtpRoute>(
        path: 'register-otp',
      ),
      TypedGoRoute<ContactListRoute>(path: 'contact-list'),
      TypedGoRoute<LoginRoute>(
        path: 'login', routes: [
          TypedGoRoute<ForgotPasswordRoute>(
            path: 'forgot-password',
          ),
          TypedGoRoute<ForgotPasswordOtpRoute>(
            path: 'forgot-password-otp',
          ),
          TypedGoRoute<ForgotPasswordChangeRoute>(
            path: 'forgot-password-change',
          ),
        ]
      ),
    ]),
    TypedGoRoute<ChooseRoleRoute>(
      path: 'choose-role',
      routes: [
        TypedGoRoute<LoginStudentRoute>(
          path: 'login-student-existing',
        ),
        TypedGoRoute<LoginParentRoute>(
          path: 'login-parent',
        ),
        TypedGoRoute<LoginAlumniRoute>(
          path: 'login-alumni',
        ),
        TypedGoRoute<NewStudentRoute>(
          path: 'new-student',
          routes: [
            TypedGoRoute<NewStudentPaymentRoute>(path: 'payment'),
            TypedGoRoute<ContactListStudentRoute>(path: 'contact-student'),
            TypedGoRoute<ContactListParentRoute>(path: 'contact-parent'),
          ],
        ),
      ],
    ),
    TypedGoRoute<WaitingPaymentRoute>(path: 'waiting-payment'),
    TypedGoRoute<PaymentMessageRoute>(path: 'payment-message'),
    TypedGoRoute<UpdateRoute>(path: 'update'),
    TypedGoRoute<AbsenceRoute>(path: 'absence'),
  ],
)
class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}
class ContactListRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return  const ContactPage();
  }
}
class ContactListParentRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return  const ContactParentPage();
  }
}
class ContactListStudentRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return  const ContactStudentPage();
  }
}
class UpdateRoute extends GoRouteData {
  final String currentVersion;
  final String newVersion;

  UpdateRoute({required this.currentVersion, required this.newVersion});
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return UpdatePage(currentVersion: currentVersion, newVersion: newVersion,);
  }
}
class NoConnectionRoute extends GoRouteData {
  final String msg;

  NoConnectionRoute({required this.msg});
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return NoConnectivityScreen(msg: msg,);
  }
}

class SettingRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingPage();
  }
}
class AbsenceRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AbsencePage();
  }
}

class PrivacyRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PrivacyPage();
  }
}

class ForgotPasswordRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ForgotPasswordPage();
  }
}

class ChangePasswordRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ChangePasswordPage();
  }
}

class NotificationRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NotificationPage();
  }
}


class ForgotPasswordOtpRoute extends GoRouteData {
  final String email;

  ForgotPasswordOtpRoute({required this.email,});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ForgotPasswordOtpPage(email: email,);
  }
}
class ForgotPasswordChangeRoute extends GoRouteData {

  final String email;
  final String otp;

  ForgotPasswordChangeRoute({required this.email, required this.otp});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ForgotPasswordChangePage(email: email, otp: otp,);
  }
}

class WebViewRoute extends GoRouteData {
  WebViewRoute({required this.url, required this.title});

  final String url;
  final String title;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return WebViewScreen(url: url, title: title,);
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

class BrochureShowPdfRoute extends GoRouteData{
  BrochureShowPdfRoute({required this.url, required this.title});

  final String url;
  final String title;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ShowPdf(linkPdf: url, title: title,);
  }
}
class PresentationShowPdfRoute extends GoRouteData{
  PresentationShowPdfRoute({required this.url, required this.title});

  final String url;
  final String title;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ShowPdf(linkPdf: url, title: title,);
  }
}
class ModulShowPdfRoute extends GoRouteData{
  ModulShowPdfRoute({required this.url, required this.title});

  final String url;
  final String title;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ShowPdf(linkPdf: url, title: title,);
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
class PaymentMessageRoute extends GoRouteData {
  final String msg;

  PaymentMessageRoute({required this.msg});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PageMessagePayment(msg: msg,);
  }
}

class ListPresentationRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ListPresentationPage();
  }
}
class FullScreenBrochureRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const FullScreenBrochurePage();
  }
}

class GalleryImageViewWrapperRoute extends GoRouteData {
  final int initialIndex;
  final List<GalleryItemModel> $extra;

  GalleryImageViewWrapperRoute({required this.initialIndex, required this.$extra });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return GalleryImageViewWrapper(
      titleGallery: 'Presentation', 
      backgroundColor: blackColor, 
      initialIndex: initialIndex, 
      galleryItems: $extra, 
      loadingWidget: null, 
      errorWidget: null, 
      minScale: 0.5, 
      maxScale: 10, 
      radius: 0.2, 
      reverse: false, 
      showListInGalley: true, 
      showAppBar: true, 
      closeWhenSwipeUp: false, 
      closeWhenSwipeDown: false,
    );
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

class ShowMoreTestimoniRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ShowMoreTestimoniPage();
  }
}
class AddTestimoniRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AddTestimoniPage();
  }
}
class GradeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const GradePage();
  }
}

class FullScreenPresentationRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const FullScreenPresentationPage();
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

class LoginStudentRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginStudentPage();
  }
}

class LoginParentRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginParentPage();
  }
}

class LoginAlumniRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginAlumniPage();
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
  final String gender;

  NewStudentPaymentRoute(
      {required this.fullname,
      required this.birthDate,
      required this.originSchool,
      required this.parentName,
      required this.phone,
      required this.parentPhone,
      required this.outfitSize,
      required this.height,
      required this.gender
    });

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
          height: height,
          gender: gender
        ),
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

class WaitingPaymentNotifRoute extends GoRouteData {
  final String id;

  WaitingPaymentNotifRoute({required this.id});
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return WaitingPaymentPage(
      id: id,
    );
  }
}

class DetailTestimoniRoute extends GoRouteData {
  final TestimoniData $extra;

  DetailTestimoniRoute({required this.$extra});
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DetailTestimoni(
      testimoni: $extra
    );
  }
}
class DetailNotifRoute extends GoRouteData {
  final String type;
  final String title;
  final String description;
  final int id;
  final int notifiableId;
  final String readAt;

  DetailNotifRoute(this.type, this.title, this.description, this.notifiableId, this.readAt, {required this.id});
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DetailNotificationPage(
      notifData: NotifData(
        data: DatumData(title: title, description: description), 
        id: id, 
        type: type, 
        notifiableId: notifiableId, 
        readAt: readAt, 
      ),
    );
  }
}

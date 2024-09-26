// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'builder.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $beginingTourRoute,
      $splashScreenRoute,
      $homeRoute,
    ];

RouteBase get $beginingTourRoute => GoRouteData.$route(
      path: '/begining',
      factory: $BeginingTourRouteExtension._fromState,
    );

extension $BeginingTourRouteExtension on BeginingTourRoute {
  static BeginingTourRoute _fromState(GoRouterState state) =>
      BeginingTourRoute();

  String get location => GoRouteData.$location(
        '/begining',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $splashScreenRoute => GoRouteData.$route(
      path: '/splash',
      factory: $SplashScreenRouteExtension._fromState,
    );

extension $SplashScreenRouteExtension on SplashScreenRoute {
  static SplashScreenRoute _fromState(GoRouterState state) =>
      SplashScreenRoute();

  String get location => GoRouteData.$location(
        '/splash',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'news-detail',
          factory: $NewsDetailRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'privacy',
          factory: $PrivacyRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'no-connection',
          factory: $NoConnectionRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'gallery-image',
          factory: $GalleryImageViewWrapperRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'presentation',
          factory: $ListPresentationRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'presentation-detail',
              factory: $PresentationShowPdfRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'presentation-fullscreen',
              factory: $FullScreenPresentationRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'modul',
          factory: $ListModulRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'modul-detail',
              factory: $ModulShowPdfRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'brochure',
          factory: $ListBrochureRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'brochure-detail',
              factory: $BrochureShowPdfRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'brochure-full-screen',
              factory: $FullScreenBrochureRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'partnership',
          factory: $PartnershipRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'webview',
          factory: $WebViewRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'profile',
          factory: $ProfileRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'notifikasi',
          factory: $NotificationRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'detail-notifikasi',
              factory: $DetailNotifRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'waiting-payment-notif',
              factory: $WaitingPaymentNotifRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'show-more-testimoni',
          factory: $ShowMoreTestimoniRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'show-more-news',
          factory: $ShowMoreNewsRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'sm-news-detail',
              factory: $SMNewsDetailRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'event',
          factory: $EventRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'event-detail',
              factory: $EventDetailRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'setting',
          factory: $SettingRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'change-password',
              factory: $ChangePasswordRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'media',
          factory: $MediaRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'register',
          factory: $RegisterRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'register-otp',
              factory: $RegisterOtpRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'login',
              factory: $LoginRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'forgot-password',
                  factory: $ForgotPasswordRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'forgot-password-otp',
                  factory: $ForgotPasswordOtpRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'forgot-password-change',
                  factory: $ForgotPasswordChangeRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'choose-role',
          factory: $ChooseRoleRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'login-student-existing',
              factory: $LoginStudentRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'login-parent',
              factory: $LoginParentRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'new-student',
              factory: $NewStudentRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'payment',
                  factory: $NewStudentPaymentRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'waiting-payment',
          factory: $WaitingPaymentRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'payment-message',
          factory: $PaymentMessageRouteExtension._fromState,
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NewsDetailRouteExtension on NewsDetailRoute {
  static NewsDetailRoute _fromState(GoRouterState state) => NewsDetailRoute(
        newsId: int.parse(state.uri.queryParameters['news-id']!),
      );

  String get location => GoRouteData.$location(
        '/news-detail',
        queryParams: {
          'news-id': newsId.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PrivacyRouteExtension on PrivacyRoute {
  static PrivacyRoute _fromState(GoRouterState state) => PrivacyRoute();

  String get location => GoRouteData.$location(
        '/privacy',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NoConnectionRouteExtension on NoConnectionRoute {
  static NoConnectionRoute _fromState(GoRouterState state) => NoConnectionRoute(
        msg: state.uri.queryParameters['msg']!,
      );

  String get location => GoRouteData.$location(
        '/no-connection',
        queryParams: {
          'msg': msg,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $GalleryImageViewWrapperRouteExtension
    on GalleryImageViewWrapperRoute {
  static GalleryImageViewWrapperRoute _fromState(GoRouterState state) =>
      GalleryImageViewWrapperRoute(
        initialIndex: int.parse(state.uri.queryParameters['initial-index']!),
        $extra: state.extra as List<GalleryItemModel>,
      );

  String get location => GoRouteData.$location(
        '/gallery-image',
        queryParams: {
          'initial-index': initialIndex.toString(),
        },
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $ListPresentationRouteExtension on ListPresentationRoute {
  static ListPresentationRoute _fromState(GoRouterState state) =>
      ListPresentationRoute();

  String get location => GoRouteData.$location(
        '/presentation',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PresentationShowPdfRouteExtension on PresentationShowPdfRoute {
  static PresentationShowPdfRoute _fromState(GoRouterState state) =>
      PresentationShowPdfRoute(
        url: state.uri.queryParameters['url']!,
        title: state.uri.queryParameters['title']!,
      );

  String get location => GoRouteData.$location(
        '/presentation/presentation-detail',
        queryParams: {
          'url': url,
          'title': title,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $FullScreenPresentationRouteExtension on FullScreenPresentationRoute {
  static FullScreenPresentationRoute _fromState(GoRouterState state) =>
      FullScreenPresentationRoute();

  String get location => GoRouteData.$location(
        '/presentation/presentation-fullscreen',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ListModulRouteExtension on ListModulRoute {
  static ListModulRoute _fromState(GoRouterState state) => ListModulRoute();

  String get location => GoRouteData.$location(
        '/modul',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ModulShowPdfRouteExtension on ModulShowPdfRoute {
  static ModulShowPdfRoute _fromState(GoRouterState state) => ModulShowPdfRoute(
        url: state.uri.queryParameters['url']!,
        title: state.uri.queryParameters['title']!,
      );

  String get location => GoRouteData.$location(
        '/modul/modul-detail',
        queryParams: {
          'url': url,
          'title': title,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ListBrochureRouteExtension on ListBrochureRoute {
  static ListBrochureRoute _fromState(GoRouterState state) =>
      ListBrochureRoute();

  String get location => GoRouteData.$location(
        '/brochure',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BrochureShowPdfRouteExtension on BrochureShowPdfRoute {
  static BrochureShowPdfRoute _fromState(GoRouterState state) =>
      BrochureShowPdfRoute(
        url: state.uri.queryParameters['url']!,
        title: state.uri.queryParameters['title']!,
      );

  String get location => GoRouteData.$location(
        '/brochure/brochure-detail',
        queryParams: {
          'url': url,
          'title': title,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $FullScreenBrochureRouteExtension on FullScreenBrochureRoute {
  static FullScreenBrochureRoute _fromState(GoRouterState state) =>
      FullScreenBrochureRoute();

  String get location => GoRouteData.$location(
        '/brochure/brochure-full-screen',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PartnershipRouteExtension on PartnershipRoute {
  static PartnershipRoute _fromState(GoRouterState state) => PartnershipRoute();

  String get location => GoRouteData.$location(
        '/partnership',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $WebViewRouteExtension on WebViewRoute {
  static WebViewRoute _fromState(GoRouterState state) => WebViewRoute(
        url: state.uri.queryParameters['url']!,
        title: state.uri.queryParameters['title']!,
      );

  String get location => GoRouteData.$location(
        '/webview',
        queryParams: {
          'url': url,
          'title': title,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProfileRouteExtension on ProfileRoute {
  static ProfileRoute _fromState(GoRouterState state) => ProfileRoute();

  String get location => GoRouteData.$location(
        '/profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NotificationRouteExtension on NotificationRoute {
  static NotificationRoute _fromState(GoRouterState state) =>
      NotificationRoute();

  String get location => GoRouteData.$location(
        '/notifikasi',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DetailNotifRouteExtension on DetailNotifRoute {
  static DetailNotifRoute _fromState(GoRouterState state) => DetailNotifRoute(
        state.uri.queryParameters['type']!,
        state.uri.queryParameters['title']!,
        state.uri.queryParameters['description']!,
        int.parse(state.uri.queryParameters['notifiable-id']!),
        state.uri.queryParameters['read-at']!,
        id: int.parse(state.uri.queryParameters['id']!),
      );

  String get location => GoRouteData.$location(
        '/notifikasi/detail-notifikasi',
        queryParams: {
          'type': type,
          'title': title,
          'description': description,
          'notifiable-id': notifiableId.toString(),
          'read-at': readAt,
          'id': id.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $WaitingPaymentNotifRouteExtension on WaitingPaymentNotifRoute {
  static WaitingPaymentNotifRoute _fromState(GoRouterState state) =>
      WaitingPaymentNotifRoute(
        id: state.uri.queryParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/notifikasi/waiting-payment-notif',
        queryParams: {
          'id': id,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ShowMoreTestimoniRouteExtension on ShowMoreTestimoniRoute {
  static ShowMoreTestimoniRoute _fromState(GoRouterState state) =>
      ShowMoreTestimoniRoute();

  String get location => GoRouteData.$location(
        '/show-more-testimoni',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ShowMoreNewsRouteExtension on ShowMoreNewsRoute {
  static ShowMoreNewsRoute _fromState(GoRouterState state) =>
      ShowMoreNewsRoute();

  String get location => GoRouteData.$location(
        '/show-more-news',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SMNewsDetailRouteExtension on SMNewsDetailRoute {
  static SMNewsDetailRoute _fromState(GoRouterState state) => SMNewsDetailRoute(
        newsId: int.parse(state.uri.queryParameters['news-id']!),
      );

  String get location => GoRouteData.$location(
        '/show-more-news/sm-news-detail',
        queryParams: {
          'news-id': newsId.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $EventRouteExtension on EventRoute {
  static EventRoute _fromState(GoRouterState state) => EventRoute();

  String get location => GoRouteData.$location(
        '/event',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $EventDetailRouteExtension on EventDetailRoute {
  static EventDetailRoute _fromState(GoRouterState state) => EventDetailRoute(
        idEvent: int.parse(state.uri.queryParameters['id-event']!),
      );

  String get location => GoRouteData.$location(
        '/event/event-detail',
        queryParams: {
          'id-event': idEvent.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingRouteExtension on SettingRoute {
  static SettingRoute _fromState(GoRouterState state) => SettingRoute();

  String get location => GoRouteData.$location(
        '/setting',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ChangePasswordRouteExtension on ChangePasswordRoute {
  static ChangePasswordRoute _fromState(GoRouterState state) =>
      ChangePasswordRoute();

  String get location => GoRouteData.$location(
        '/setting/change-password',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MediaRouteExtension on MediaRoute {
  static MediaRoute _fromState(GoRouterState state) => MediaRoute();

  String get location => GoRouteData.$location(
        '/media',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $RegisterRouteExtension on RegisterRoute {
  static RegisterRoute _fromState(GoRouterState state) => RegisterRoute();

  String get location => GoRouteData.$location(
        '/register',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $RegisterOtpRouteExtension on RegisterOtpRoute {
  static RegisterOtpRoute _fromState(GoRouterState state) => RegisterOtpRoute(
        email: state.uri.queryParameters['email']!,
      );

  String get location => GoRouteData.$location(
        '/register/register-otp',
        queryParams: {
          'email': email,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => LoginRoute();

  String get location => GoRouteData.$location(
        '/register/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ForgotPasswordRouteExtension on ForgotPasswordRoute {
  static ForgotPasswordRoute _fromState(GoRouterState state) =>
      ForgotPasswordRoute();

  String get location => GoRouteData.$location(
        '/register/login/forgot-password',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ForgotPasswordOtpRouteExtension on ForgotPasswordOtpRoute {
  static ForgotPasswordOtpRoute _fromState(GoRouterState state) =>
      ForgotPasswordOtpRoute(
        email: state.uri.queryParameters['email']!,
      );

  String get location => GoRouteData.$location(
        '/register/login/forgot-password-otp',
        queryParams: {
          'email': email,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ForgotPasswordChangeRouteExtension on ForgotPasswordChangeRoute {
  static ForgotPasswordChangeRoute _fromState(GoRouterState state) =>
      ForgotPasswordChangeRoute(
        email: state.uri.queryParameters['email']!,
        otp: state.uri.queryParameters['otp']!,
      );

  String get location => GoRouteData.$location(
        '/register/login/forgot-password-change',
        queryParams: {
          'email': email,
          'otp': otp,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ChooseRoleRouteExtension on ChooseRoleRoute {
  static ChooseRoleRoute _fromState(GoRouterState state) => ChooseRoleRoute();

  String get location => GoRouteData.$location(
        '/choose-role',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LoginStudentRouteExtension on LoginStudentRoute {
  static LoginStudentRoute _fromState(GoRouterState state) =>
      LoginStudentRoute();

  String get location => GoRouteData.$location(
        '/choose-role/login-student-existing',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LoginParentRouteExtension on LoginParentRoute {
  static LoginParentRoute _fromState(GoRouterState state) => LoginParentRoute();

  String get location => GoRouteData.$location(
        '/choose-role/login-parent',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NewStudentRouteExtension on NewStudentRoute {
  static NewStudentRoute _fromState(GoRouterState state) => NewStudentRoute();

  String get location => GoRouteData.$location(
        '/choose-role/new-student',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NewStudentPaymentRouteExtension on NewStudentPaymentRoute {
  static NewStudentPaymentRoute _fromState(GoRouterState state) =>
      NewStudentPaymentRoute(
        fullname: state.uri.queryParameters['fullname']!,
        birthDate: state.uri.queryParameters['birth-date']!,
        originSchool: state.uri.queryParameters['origin-school']!,
        parentName: state.uri.queryParameters['parent-name']!,
        phone: state.uri.queryParameters['phone']!,
        parentPhone: state.uri.queryParameters['parent-phone']!,
        outfitSize: state.uri.queryParameters['outfit-size']!,
        height: state.uri.queryParameters['height']!,
        gender: state.uri.queryParameters['gender']!,
      );

  String get location => GoRouteData.$location(
        '/choose-role/new-student/payment',
        queryParams: {
          'fullname': fullname,
          'birth-date': birthDate,
          'origin-school': originSchool,
          'parent-name': parentName,
          'phone': phone,
          'parent-phone': parentPhone,
          'outfit-size': outfitSize,
          'height': height,
          'gender': gender,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $WaitingPaymentRouteExtension on WaitingPaymentRoute {
  static WaitingPaymentRoute _fromState(GoRouterState state) =>
      WaitingPaymentRoute(
        id: state.uri.queryParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/waiting-payment',
        queryParams: {
          'id': id,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PaymentMessageRouteExtension on PaymentMessageRoute {
  static PaymentMessageRoute _fromState(GoRouterState state) =>
      PaymentMessageRoute(
        msg: state.uri.queryParameters['msg']!,
      );

  String get location => GoRouteData.$location(
        '/payment-message',
        queryParams: {
          'msg': msg,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

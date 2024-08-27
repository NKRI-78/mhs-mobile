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
          path: 'presentation',
          factory: $ListPresentationRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'modul',
          factory: $ListModulRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'brochure',
          factory: $ListBrochureRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'partnership',
          factory: $PartnershipRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'profile',
          factory: $ProfileRouteExtension._fromState,
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
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'choose-role',
          factory: $ChooseRoleRouteExtension._fromState,
          routes: [
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

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

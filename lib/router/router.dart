import 'package:go_router/go_router.dart';
import 'package:mhs_mobile/modules/app/bloc/app_bloc.dart';
import 'package:mhs_mobile/router/builder.dart';

class MyRouter {
  static GoRouter init(AppBloc app) => GoRouter(
        routes: $appRoutes,
        initialLocation: app.state.alreadyShowBeginingTour
            ? HomeRoute().location
            : BeginingTourRoute().location,
      );
}

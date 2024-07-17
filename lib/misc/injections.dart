import 'package:get_it/get_it.dart';
import 'package:mhs_mobile/modules/app/bloc/app_bloc.dart';
import 'package:mhs_mobile/repositories/auth_repository/auth_repository.dart';

final getIt = GetIt.instance;

class MyInjection {
  /// Setup injection bloc and repository
  /// Just setup global blocs or repository; * dont all
  static setup() {
    /// Blocs
    getIt.registerLazySingleton<AppBloc>(() => AppBloc());

    /// Repositories
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
  }
}

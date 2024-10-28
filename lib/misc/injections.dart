import 'package:get_it/get_it.dart';
import 'package:mhs_mobile/misc/http_client.dart';
import 'package:mhs_mobile/modules/absence/cubit/absence_cubit.dart';
import 'package:mhs_mobile/modules/add_testimoni/cubit/add_testimoni_cubit.dart';
import 'package:mhs_mobile/modules/app/bloc/app_bloc.dart';
import 'package:mhs_mobile/modules/connectivity/bloc/connectivity_bloc.dart';
import 'package:mhs_mobile/modules/connectivity/cubit/connectivity_cubit.dart';
import 'package:mhs_mobile/modules/detail_event/cubit/event_detail_cubit.dart';
import 'package:mhs_mobile/modules/event/bloc/event_bloc.dart';
import 'package:mhs_mobile/modules/grade/cubit/grade_cubit.dart';
import 'package:mhs_mobile/modules/login/cubit/login_cubit.dart';
import 'package:mhs_mobile/modules/login_alumni/cubit/login_alumni_cubit.dart';
import 'package:mhs_mobile/modules/login_student/cubit/login_student_cubit.dart';
import 'package:mhs_mobile/modules/news_detail/cubit/detail_news_cubit.dart';
import 'package:mhs_mobile/modules/notification/bloc/notification_bloc.dart';
import 'package:mhs_mobile/modules/profile/cubit/profile_cubit.dart';
import 'package:mhs_mobile/modules/show_more_news/cubit/show_more_news_cubit.dart';
import 'package:mhs_mobile/repositories/absence_repository/absence_repository.dart';
import 'package:mhs_mobile/repositories/add_testimoni_repository/add_testimoni_repository.dart';
import 'package:mhs_mobile/repositories/app_repository/app_repository.dart';
import 'package:mhs_mobile/repositories/auth_repository/auth_repository.dart';
import 'package:mhs_mobile/repositories/event_repository/event_repository.dart';
import 'package:mhs_mobile/repositories/grade_student_repository/grade_student_repository.dart';
import 'package:mhs_mobile/repositories/news_repository/news_repository.dart';
import 'package:mhs_mobile/repositories/profile_repository/profile_repository.dart';

final getIt = GetIt.instance;

class MyInjection {
  /// Setup injection bloc and repository
  /// Just setup global blocs or repository; * dont all
  static setup() {
    /// Blocs
    getIt.registerLazySingleton<AppBloc>(() => AppBloc());
    getIt.registerLazySingleton<EventBloc>(() => EventBloc());
    getIt.registerLazySingleton<NotificationBloc>(() => NotificationBloc());
    getIt.registerLazySingleton<ConnectivityBloc>(() => ConnectivityBloc());

    //Cubit
    getIt.registerLazySingleton<EventDetailCubit>(() => EventDetailCubit());
    getIt.registerLazySingleton<AbsenceCubit>(() => AbsenceCubit());
    getIt.registerLazySingleton<InternetCubit>(() => InternetCubit());
    getIt.registerLazySingleton<DetailNewsCubit>(() => DetailNewsCubit());
    getIt.registerLazySingleton<ShowMoreNewsCubit>(() => ShowMoreNewsCubit());
    getIt.registerLazySingleton<LoginAlumniCubit>(() => LoginAlumniCubit());
    getIt.registerLazySingleton<ProfileCubit>(() => ProfileCubit());
    getIt.registerLazySingleton<LoginCubit>(() => LoginCubit());
    getIt.registerLazySingleton<LoginStudentCubit>(() => LoginStudentCubit());
    getIt.registerLazySingleton<AddTestimoniCubit>(() => AddTestimoniCubit());
    getIt.registerLazySingleton<GradeCubit>(() => GradeCubit());

    /// Http Client
    getIt.registerLazySingleton<BaseNetworkClient>(
      () => BaseNetworkClient(),
    );

    /// Repositories
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
    getIt.registerLazySingleton<EventRepository>(() => EventRepository());
    getIt.registerLazySingleton<NewsRepository>(() => NewsRepository());
    getIt.registerLazySingleton<AppRepository>(() => AppRepository());
    getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepository());
    getIt.registerLazySingleton<AbsenceRepository>(() => AbsenceRepository());
    getIt.registerLazySingleton<AddTestimoniRepository>(() => AddTestimoniRepository());
    getIt.registerLazySingleton<GradeStudentRepository>(() => GradeStudentRepository());
  }
}

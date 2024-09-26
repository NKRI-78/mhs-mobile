import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhs_mobile/misc/firebase_messangging.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/app/bloc/app_bloc.dart';
import 'package:mhs_mobile/modules/connectivity/bloc/connectivity_bloc.dart';
import 'package:mhs_mobile/modules/connectivity/bloc/connectivity_state.dart';
import 'package:mhs_mobile/modules/connectivity/view/connectivity_page.dart';
import 'package:mhs_mobile/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBackup extends StatelessWidget {
  const AppBackup({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (BuildContext context) => AppBloc(),
        ),
        BlocProvider<ConnectivityBloc>(
          create: (BuildContext context) => ConnectivityBloc(),
        ),
      ], child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  GoRouter router = MyRouter.init(
    getIt<AppBloc>(),
  );

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FirebaseMessagingMisc.init();
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, st) {
        return  BlocBuilder<ConnectivityBloc, ConnectivityState>(
          builder: (context, network) {
            if (network is ConnectivityInitial) {
              return const NoConnectivityScreen(msg: 'Checking connectivity...');
            } else if (network is ConnectivityFailure) {
              return const NoConnectivityScreen(msg: 'Tidak Ada Koneksi Internet, Nyalakan Internet Anda',);
            }
            return MaterialApp.router(
              theme: baseTheme.copyWith(
                textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
              ),
              routerConfig: router,
            );
          }
        );
      }
    );
  }
}

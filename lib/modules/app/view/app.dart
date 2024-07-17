import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/app/bloc/app_bloc.dart';
import 'package:mhs_mobile/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (context) => AppBloc(),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: baseTheme.copyWith(
        textTheme: GoogleFonts.robotoTextTheme(baseTheme.textTheme),
      ),
      routerConfig: MyRouter.init(
        context.read<AppBloc>(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/connectivity/cubit/connectivity_cubit.dart';
import 'package:mhs_mobile/widgets/extension/snackbar.dart';
import 'package:mhs_mobile/widgets/pages/pages_loading.dart';

class NetworkObserverInThemePage extends StatelessWidget {
  const NetworkObserverInThemePage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InternetCubit>(
      create: (context) => InternetCubit(),
      child: NetworkObserverInThemeView(child: child,),
    );
  }
}

class NetworkObserverInThemeView extends StatefulWidget {
  final Widget child;

  const NetworkObserverInThemeView({super.key, required this.child});

  @override
  _NetworkObserverInThemeViewkState createState() => _NetworkObserverInThemeViewkState();
}

class _NetworkObserverInThemeViewkState extends State<NetworkObserverInThemeView> {
  void showSnackBar(String text, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: color,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InternetCubit, InternetState>(
        listener: (context, state) {
      if (state == InternetState.lost) {
        ShowSnackbar.snackbar(context, "Terjadi kesalahan jaringan", '', errorColor);
      }
    }, builder: (context, state) {
      if (state == InternetState.gained) {
        return widget.child;
      }
      if (state == InternetState.lost) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .75,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  noConnection
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Tidak ada kenoksi internet",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: redColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      }
      return const LoadingPage();
    });
  }
}

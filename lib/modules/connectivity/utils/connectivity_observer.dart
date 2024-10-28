import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/connectivity/cubit/connectivity_cubit.dart';
import 'package:mhs_mobile/modules/connectivity/view/connectivity_page.dart';
import 'package:mhs_mobile/widgets/extension/snackbar.dart';
import 'package:mhs_mobile/widgets/pages/pages_loading.dart';

class NetworkObserverPage extends StatelessWidget {
  const NetworkObserverPage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InternetCubit>(
      create: (context) => InternetCubit(),
      child: NetworkObserverView(child: child,),
    );
  }
}

class NetworkObserverView extends StatefulWidget {
  final Widget child;

  const NetworkObserverView({super.key, required this.child});

  @override
  _NetworkObserverViewkState createState() => _NetworkObserverViewkState();
}

class _NetworkObserverViewkState extends State<NetworkObserverView> {
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
        return const NoConnectivityScreen(msg: 'Maaf terjadi kesalahan pada jaringan anda, pastikan anda terhubung pada internet.',);
      }
      return const LoadingPage();
    });
  }
}

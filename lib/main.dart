import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/modules/app/bloc_observer.dart';
import 'package:mhs_mobile/modules/app/view/app.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  Bloc.observer = const AppBlocObserver();

  MyInjection.setup();
  
  runApp(const App());
}

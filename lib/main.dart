import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mhs_mobile/firebase_options.dart';
import 'package:mhs_mobile/misc/firebase_messangging.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/modules/app/bloc_observer.dart';
import 'package:mhs_mobile/modules/app/view/app.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  Bloc.observer = const AppBlocObserver();

  MyInjection.setup();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    await setupFlutterNotifications();
  }
  
  runApp(const App());
}

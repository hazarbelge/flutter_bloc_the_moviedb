import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:the_movie_db_flutter/app.dart';
import 'package:the_movie_db_flutter/util/index.dart';

Future<void> main() async {
  //debugPrint = (String? message, {int? wrapWidth}) {};

  WidgetsFlutterBinding.ensureInitialized();

  ConnectivityUtil.configureConnectivityStream();

  final HydratedStorage hydratedStorage = await HydratedStorage.build(
    storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getTemporaryDirectory(),
  );

  SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    BlocOverrides.runZoned(
      () => HydratedBlocOverrides.runZoned(
        () => runApp(const MovieApp()),
        storage: hydratedStorage,
      ),
      blocObserver: CustomBlocObserver(),
    );
  });
}

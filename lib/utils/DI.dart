import 'package:exhibit_app/api/network/RestProvider.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerLazySingleton(() => RestProvider());
}

import 'package:get_it/get_it.dart';
import 'package:medicon/services/unique/user_service.dart';

final GetIt locator = GetIt.instance;
void setUp() {

  locator.registerLazySingleton<UserService>(
    () => UserService(),
  );

}
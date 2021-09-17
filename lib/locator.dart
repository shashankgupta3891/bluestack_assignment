import 'package:bluestack_assignment/core/api_repository/auth_api_repository.dart';
import 'package:bluestack_assignment/core/api_repository/tournament_api_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<TournamentApiRepository>(
      () => TournamentApiRepository());
  locator.registerLazySingleton<AuthApiRepository>(() => AuthApiRepository());
}

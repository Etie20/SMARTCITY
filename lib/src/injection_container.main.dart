part of 'injection_container.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  await dotenv.load(fileName: ".env");

  _initAuth();

  if (AppSecrets.supabaseUrl == null || AppSecrets.supabaseKey == null) {
    throw Exception('Supabase credentials not found');
  }
  final supabase = await Supabase.initialize(
      url: AppSecrets.supabaseUrl!, anonKey: AppSecrets.supabaseKey!);

  serviceLocator.registerLazySingleton(() => supabase.client);
  //core
  serviceLocator.registerLazySingleton(() => AppUserCubit());

  serviceLocator.registerFactory(() => InternetConnection());
  serviceLocator.registerFactory<ConnectionChecker>(
        () => ConnectionCheckerImpl(
      serviceLocator(),
    ),
  );
}

void _initAuth() {
  serviceLocator
  //datasource
    ..registerFactory<AuthRemoteDataSource>(
          () => AuthRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
  //repository
    ..registerFactory<AuthRepository>(
          () => AuthRepositoryImpl(
        serviceLocator(),
        serviceLocator(),
      ),
    )
  //usecases
    ..registerFactory(
          () => UserSignUp(
        serviceLocator(),
      ),
    )
    ..registerFactory(
          () => UserLogin(
        serviceLocator(),
      ),
    )
    ..registerFactory(
          () => CurrenUser(
        serviceLocator(),
      ),
    )
  //bloc
    ..registerLazySingleton(
          () => AuthBloc(
        userSignUp: serviceLocator(),
        userLogin: serviceLocator(),
        currentUser: serviceLocator(),
        appUserCubit: serviceLocator(),
      ),
    );
}
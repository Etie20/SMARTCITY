import 'package:fpdart/fpdart.dart';
import 'package:smart_city/src/core/common/entities/user.dart';
import 'package:smart_city/src/core/constants/constants.dart';
import 'package:smart_city/src/core/error/exceptions.dart';
import 'package:smart_city/src/core/error/failures.dart';
import 'package:smart_city/src/core/network/connection_checker.dart';
import 'package:smart_city/src/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:smart_city/src/features/auth/data/models/user_model.dart';
import 'package:smart_city/src/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final ConnectionChecker connectionChecker;
  const AuthRepositoryImpl(this.authRemoteDataSource, this.connectionChecker);

  @override
  Future<Either<Failure, User>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _getUser(
      () async => await authRemoteDataSource.loginWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    return _getUser(
      () async => await authRemoteDataSource.signUpWithEmailAndPassword(
        name: name,
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, User>> currentUser() async {
    try {
      if (!await connectionChecker.isConnected) {
        final session = authRemoteDataSource.currentUserSession;
        if (session == null) {
          return left(
            Failure('User not logged in!'),
          );
        }

        return right(UserModel(
          id: session.user.id,
          email: session.user.email ?? '',
          name: '',
        ));
      }

      final user = await authRemoteDataSource.getCurrentUserData();
      if (user == null) {
        return left(
          Failure('User not logged in!'),
        );
      }
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, User>> _getUser(
    Future<User> Function() fn,
  ) async {
    try {
      if (!await connectionChecker.isConnected) {
        return left(Failure(Constants.noConnectionMessage));
      }
      final user = await fn();
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}

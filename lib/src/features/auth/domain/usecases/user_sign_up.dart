import 'package:fpdart/fpdart.dart';
import 'package:smart_city/src/core/common/entities/user.dart';
import 'package:smart_city/src/core/error/failures.dart';
import 'package:smart_city/src/core/usecase/usecase.dart';
import 'package:smart_city/src/features/auth/domain/repository/auth_repository.dart';

class UserSignUp implements UseCase<User, UserSignUpParams> {
  final AuthRepository authRepository;

  UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailAndPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;

  UserSignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}

import 'package:fpdart/fpdart.dart';
import 'package:smart_city/src/core/common/entities/user.dart';
import 'package:smart_city/src/core/error/failures.dart';
import 'package:smart_city/src/core/usecase/usecase.dart';
import 'package:smart_city/src/features/auth/domain/repository/auth_repository.dart';

class CurrenUser implements UseCase<User, NoParams> {
  final AuthRepository authRepository;

  CurrenUser(this.authRepository);
  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}



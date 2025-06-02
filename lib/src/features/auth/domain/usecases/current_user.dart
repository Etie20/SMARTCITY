import 'package:fpdart/fpdart.dart';

class CurrenUser implements UseCase<User, NoParams> {
  final AuthRepository authRepository;

  CurrenUser(this.authRepository);
  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}



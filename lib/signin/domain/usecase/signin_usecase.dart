import 'package:bluebenx/core/exceptions/failure_exception.dart';
import 'package:bluebenx/signin/domain/entity/user_entity.dart';
import 'package:bluebenx/signin/domain/repository/signin_repository.dart';
import 'package:dartz/dartz.dart';

class SigninUsecase {
  final SigninRepository _signinRepository;

  SigninUsecase({
    required SigninRepository signinRepository,
  }) : _signinRepository = signinRepository;

  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
  }) async {
    return await _signinRepository.signinWithEmail(
      email: email,
      password: password,
    );
  }
}

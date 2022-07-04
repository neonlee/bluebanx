import 'package:bluebenx/core/exceptions/failure_exception.dart';
import 'package:bluebenx/signin/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SigninRepository {
  Future<Either<Failure, UserEntity>> signinWithEmail({
    required String email,
    required String password,
  });
}

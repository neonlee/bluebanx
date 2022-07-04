import 'package:bluebenx/signin/data/datasource/signin_remote_datasource.dart';
import 'package:bluebenx/signin/domain/entity/user_entity.dart';
import 'package:bluebenx/core/exceptions/failure_exception.dart';
import 'package:bluebenx/signin/domain/repository/signin_repository.dart';
import 'package:dartz/dartz.dart';

class SigninRepositoryImpl extends SigninRepository {
  final SigninRemoteDatasource _signinRemoteDatasource;

  SigninRepositoryImpl({
    required SigninRemoteDatasource signinRemoteDatasource,
  }) : _signinRemoteDatasource = signinRemoteDatasource;

  @override
  Future<Either<Failure, UserEntity>> signinWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      var response = await _signinRemoteDatasource.signin(
        email: email,
        password: password,
      );

      return Right(response);
    } catch (e) {
      return Left(Failure(message: ''));
    }
  }
}

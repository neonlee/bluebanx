import 'package:bluebenx/home/data/datasource/home_remote_datasource.dart';
import 'package:bluebenx/home/data/repository/home_repository_impl.dart';
import 'package:bluebenx/home/domain/repository/home_repository.dart';
import 'package:bluebenx/home/domain/usecase/home_usecase.dart';
import 'package:bluebenx/home/presentation/store/home_bloc.dart';
import 'package:bluebenx/infra/firebase/firebase_auth.dart';
import 'package:bluebenx/infra/http_client/http_client.dart';
import 'package:bluebenx/signin/data/datasource/signin_remote_datasource.dart';
import 'package:bluebenx/signin/data/repository/signin_repository_impl.dart';
import 'package:bluebenx/signin/domain/repository/signin_repository.dart';
import 'package:bluebenx/signin/domain/usecase/signin_usecase.dart';
import 'package:bluebenx/signin/presentation/store/signin_bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

void init() async {
  var getIt = GetIt.I;

  getIt.registerSingleton(FirebaseAuth.instance);

  getIt.registerFactory(() => Dio(BaseOptions(
        baseUrl: 'https://api.coingecko.com/api/v3/',
      )));

  getIt.registerFactory<IHttpClient>(
    () => HttpClient(
      dio: getIt.get(),
      interceptors: InterceptorsWrapper(),
    ),
  );

  getIt.registerSingleton(
    FirebaseAuthCustom(
      firebaseAuth: getIt.get(),
    ),
  );

  getIt.registerSingleton<SigninRemoteDatasource>(SigninRemoteDatasourceImpl(
    firebaseAuthCustom: getIt.get(),
  ));

  getIt.registerSingleton<SigninRepository>(
    SigninRepositoryImpl(signinRemoteDatasource: getIt.get()),
  );

  getIt.registerSingleton<SigninUsecase>(
    SigninUsecase(signinRepository: getIt.get()),
  );

  getIt.registerSingleton<AuthBloc>(
    AuthBloc(signinUsecase: getIt.get()),
  );

  getIt.registerSingleton<HomeDatasource>(
    HomeDatasourceImpl(httpClient: getIt.get()),
  );

  getIt.registerSingleton<HomeRepository>(
    HomeRepositoryImpl(homeDatasource: getIt.get()),
  );

  getIt.registerSingleton<HomeUsecase>(
    HomeUsecase(homeRepository: getIt.get()),
  );

  getIt.registerSingleton<PostBloc>(
    PostBloc(homeusecase: getIt.get()),
  );
}

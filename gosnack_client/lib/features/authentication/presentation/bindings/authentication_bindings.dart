import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gosnack_client/features/authentication/data/datasources/auth_firebase_datasource.dart';
import 'package:gosnack_client/features/authentication/data/datasources/auth_local_datasource.dart';
import 'package:gosnack_client/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:gosnack_client/features/authentication/domain/interfaces/authentication_repository.dart';
import 'package:gosnack_client/features/authentication/domain/use_cases/check_authentication_status_usecase.dart';
import 'package:gosnack_client/features/authentication/domain/use_cases/screen_redirect_usecase.dart';
import 'package:gosnack_client/features/authentication/domain/use_cases/signin_usecase.dart';
import 'package:gosnack_client/features/authentication/domain/use_cases/signout_usecase.dart';
import 'package:gosnack_client/features/authentication/presentation/controllers/auth_controller.dart';

/// Bindings para injeção de dependências no módulo de autenticação.
class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    // -- Injetar Data Sources
    Get.lazyPut<AuthFirebaseDatasource>(
      () => AuthFirebaseDatasource(FirebaseAuth.instance),
    );
    Get.lazyPut<AuthLocalDatasource>(() => AuthLocalDatasource(GetStorage()));

    // -- Injetar Repositório
    Get.lazyPut<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(
        Get.find<AuthFirebaseDatasource>(),
        Get.find<AuthLocalDatasource>(),
      ),
    );

    // -- Injetar Use Cases
    Get.lazyPut(() => CheckAuthenticationStatusUsecase(Get.find()));
    Get.lazyPut(() => LoginUseCase(Get.find()));
    Get.lazyPut(() => LogoutUseCase(Get.find()));
    Get.lazyPut(() => ScreenRedirectUseCase(Get.find()));

    // -- Injetar Controller (Get.put para inicialização imediata)
    Get.put(
      AuthController(
        Get.find<ScreenRedirectUseCase>(),
        Get.find<LoginUseCase>(),
        Get.find<LogoutUseCase>(),
        Get.find<CheckAuthenticationStatusUsecase>(),
      ),
    );
  }
}

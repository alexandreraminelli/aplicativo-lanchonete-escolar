import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:gosnack_client/features/authentication/data/datasources/remote/firebase_auth_datasource.dart';
import 'package:gosnack_client/features/authentication/data/datasources/remote/user_firestore_datasource.dart';
import 'package:gosnack_client/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:gosnack_client/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:gosnack_client/features/authentication/domain/use_cases/check_authentication_status_usecase.dart';
import 'package:gosnack_client/features/authentication/domain/use_cases/screen_redirect_usecase.dart';
import 'package:gosnack_client/features/authentication/domain/use_cases/login_usecase.dart';
import 'package:gosnack_client/features/authentication/domain/use_cases/signout_usecase.dart';
import 'package:gosnack_client/features/authentication/presentation/controllers/auth_controller.dart';

/// Bindings para injeção de dependências no módulo de autenticação.
class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    // -- Injetar Data Sources
    Get.lazyPut<FirebaseAuthDatasource>(
      () => FirebaseAuthDatasource(FirebaseAuth.instance),
    );
    Get.lazyPut<UserFirestoreDatasource>(
      () => UserFirestoreDatasource(FirebaseFirestore.instance),
    );

    // -- Injetar Repositório
    Get.lazyPut<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(
        Get.find<FirebaseAuthDatasource>(),
        Get.find<UserFirestoreDatasource>(),
      ),
    );

    // -- Injetar Use Cases
    Get.lazyPut(() => CheckAuthenticationStatusUsecase(Get.find()));
    Get.lazyPut(() => LoginUseCase(Get.find()));
    Get.lazyPut(() => LogoutUseCase(Get.find()));
    Get.lazyPut(() => ScreenRedirectUseCase(Get.find(), Get.find()));

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

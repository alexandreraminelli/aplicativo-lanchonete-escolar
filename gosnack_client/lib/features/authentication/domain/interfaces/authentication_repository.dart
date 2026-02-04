import 'package:gosnack_client/features/authentication/domain/entities/user_entity.dart';

/// Interface com o contrato do repositório de autenticação.
///
/// Define os métodos que devem ser implementados para a autenticação
/// do usuário.
abstract class AuthenticationRepository {
  // -- Authentication ------------------------------------------------------ //

  /// Obtém o usuário autenticado atualmente.
  /// Retorna `null` se não houver.
  UserEntity? getCurrentUser();

  /// Efetua login com e-mail e senha.
  Future<UserEntity> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Registra um novo usuário com e-mail, senha, nome e sobrenome.
  Future<UserEntity> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });

  /// Efetua logout do usuário atual.
  Future<void> logout();

  /// Verifica se o usuário está autenticado.
  bool isAuthenticated();

  // -- OnBoarding ---------------------------------------------------------- //

  /// Verifica se o usuário já passou pela tela de onboarding (boas-vindas).
  bool isFirstTime();

  /// Marca que o usuário já passou pela tela de onboarding (boas-vindas).
  Future<void> setFirstTimeFalse();
}

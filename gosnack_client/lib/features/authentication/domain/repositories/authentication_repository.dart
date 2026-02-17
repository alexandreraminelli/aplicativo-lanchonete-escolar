import 'package:firebase_auth/firebase_auth.dart';
import 'package:gosnack_client/features/authentication/domain/entities/user_entity.dart';

/// Interface com o contrato do repositório de autenticação.
///
/// Define os métodos que devem ser implementados para a autenticação
/// do usuário.
abstract class AuthenticationRepository {
  /// Obtém o usuário autenticado atualmente.
  /// Retorna `null` se não houver.
  Future<User?> getCurrentUser();

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

  /// Reenvia o e-mail de verificação para o usuário.
  Future<void> resendVerificationEmail();
}

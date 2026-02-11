import 'package:gosnack_client/features/authentication/domain/entities/user_entity.dart';
import 'package:gosnack_client/features/authentication/domain/interfaces/authentication_repository.dart';
import 'package:gosnack_client/core/errors/no_internet_exception.dart';
import 'package:gosnack_client/core/network/network_manager.dart';

/// Use Case para registrar um novo usuário.
class SignUpUseCase {
  // -- Private Instance Variables ------------------------------------------ //

  /// Repositório de autenticação.
  final AuthenticationRepository _repository;

  // -- Public Constructor -------------------------------------------------- //

  SignUpUseCase(this._repository);

  // -- Public Methods ------------------------------------------------------ //

  /// Registra um novo usuário no sistema.
  ///
  /// Lança [NoInternetException] se não houver conexão com a internet.
  /// Lança exceção do repositório em caso de falha no registro.
  /// Retorna a entidade do usuário registrado em caso de sucesso.
  Future<UserEntity?> call({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    // Verificar conexão com a internet
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      throw const NoInternetException();
    }
    // Criar conta no repositório
    return await _repository.signUpWithEmailAndPassword(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );
  }
}

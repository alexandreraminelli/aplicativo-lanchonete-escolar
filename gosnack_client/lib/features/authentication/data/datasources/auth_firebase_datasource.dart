import 'package:firebase_auth/firebase_auth.dart';

/// Datasource remoto que obtêm os dados de autenticação do Firebase Auth
/// e do Firestore.
class AuthFirebaseDatasource {
  // -- Private Instance Variables ------------------------------------------ //

  /// Instância do Firebase Auth para realizar operações de autenticação.
  final FirebaseAuth _auth;

  // -- Public Constructor -------------------------------------------------- //

  AuthFirebaseDatasource(this._auth);

  // -- Public Methods ------------------------------------------------------ //

  /// Retorna a conta do usuário atualmente autenticado no Firebase Auth.
  /// Retorna `null` se nenhum usuário estiver autenticado.
  User? getCurrentFirebaseUser() {
    return _auth.currentUser;
  }

  /// Efetua login no Firebase Auth com e-mail e senha.
  Future<User> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    // Realizar login e retornar credenciais
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user!;
  }

  /// Cadastra um novo usuário no Firebase Auth com e-mail e senha.
  Future<User> registerWithEmailAndPassword(
    // TODO: adicionar parâmetros
  ) {
    // TODO: implementar criação de conta
    throw UnimplementedError();
  }

  /// Efetua o logout do Firebase Auth.
  Future<void> logout() async {
    await _auth.signOut();
  }
}

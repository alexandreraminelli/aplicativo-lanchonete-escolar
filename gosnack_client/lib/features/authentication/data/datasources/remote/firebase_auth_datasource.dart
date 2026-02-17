import 'package:firebase_auth/firebase_auth.dart';
import 'package:gosnack_client/core/errors/firebase_exception.dart';
import 'package:gosnack_client/core/logging/logger.dart';

/// Datasource remoto que obtêm os dados de autenticação do Firebase Auth
/// e do Firestore.
class FirebaseAuthDatasource {
  // -- Private Instance Variables ------------------------------------------ //

  /// Instância do Firebase Auth para realizar operações de autenticação.
  final FirebaseAuth _auth;

  // -- Public Constructor -------------------------------------------------- //

  FirebaseAuthDatasource(this._auth);

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
    try {
      // Realizar login e retornar credenciais
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Sucesso
      LoggerHelp.info(
        'Usuário logado com sucesso: ${userCredential.user?.uid}',
      );
      return userCredential.user!;
    } on FirebaseException catch (e) {
      LoggerHelp.error(
        'Erro ao efetuar login: Código: ${e.code}, Mensagem: ${e.message}',
      );
      throw AppFirebaseException(e.code);
    } catch (e) {
      LoggerHelp.error('Erro ao efetuar login: $e');
      throw AppFirebaseException('unknown');
    }
  }

  /// Cadastra um novo usuário no Firebase Auth com e-mail e senha.
  Future<UserCredential> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      // Criar conta no Firebase Auth
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Sucesso
      LoggerHelp.info(
        'Usuário registrado com sucesso: ${userCredential.user?.uid}',
      );
      return userCredential;
    } on FirebaseException catch (e) {
      // Erro do Firebase
      LoggerHelp.error(
        'Erro ao registrar usuário: Código: ${e.code}, Mensagem: ${e.message}',
      );
      throw AppFirebaseException(e.code);
    } catch (e) {
      // Outros erros
      LoggerHelp.error('Erro ao registrar usuário: $e');
      throw AppFirebaseException('unknown');
    }
  }

  /// Efetua o logout do Firebase Auth.
  Future<void> logout() async {
    try {
      await _auth.signOut();
    } on FirebaseException catch (e) {
      // Erro do Firebase
      LoggerHelp.error(
        'Erro ao efetuar logout: Código: ${e.code}, Mensagem: ${e.message}',
      );
      throw AppFirebaseException(e.code);
    } catch (e) {
      // Outros erros
      LoggerHelp.error('Erro ao efetuar logout: $e');
      throw AppFirebaseException('unknown');
    }
  }

  /// Reenvia o e-mail de verificação para o usuário autenticado.
  Future<void> resendVerificationEmail() async {
    try {
      // Obter o usuário autenticado
      final user = _auth.currentUser;
      if (user == null) {
        throw AppFirebaseException('no-user');
      }
      // Reenviar e-mail de verificação
      await user.sendEmailVerification();
      // Sucesso
      LoggerHelp.info('E-mail de verificação reenviado para: ${user.email}');
    } on FirebaseException catch (e) {
      LoggerHelp.error(
        'Erro ao reenviar e-mail de verificação: Código: ${e.code}, Mensagem: ${e.message}',
      );
      throw AppFirebaseException(e.code);
    } catch (e) {
      LoggerHelp.error('Erro ao reenviar e-mail de verificação: $e');
      throw AppFirebaseException('unknown');
    }
  }
}

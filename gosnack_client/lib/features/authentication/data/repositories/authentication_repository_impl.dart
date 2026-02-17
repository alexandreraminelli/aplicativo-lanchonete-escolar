import 'package:firebase_auth/firebase_auth.dart';
import 'package:gosnack_client/features/authentication/data/datasources/remote/firebase_auth_datasource.dart';
import 'package:gosnack_client/features/authentication/data/datasources/remote/user_firestore_datasource.dart';
import 'package:gosnack_client/features/authentication/data/models/user_model.dart';
import 'package:gosnack_client/features/authentication/domain/entities/user_entity.dart';
import 'package:gosnack_client/features/authentication/domain/repositories/authentication_repository.dart';

/// Implementação concreta do repositório de autenticação.
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  // -- Private Instance Variables ------------------------------------------ //

  // -- Datasources
  final FirebaseAuthDatasource _remoteAuthDatasource;
  final UserFirestoreDatasource _removeFirestoreDatasource;

  // -- Public Constructor -------------------------------------------------- //

  AuthenticationRepositoryImpl(
    this._remoteAuthDatasource,
    this._removeFirestoreDatasource,
  );

  // -- Public Override Methods --------------------------------------------- //

  @override
  Future<User?> getCurrentUser() async {
    try {
      // Obter usuário do Firebase Auth
      final firebaseUser = _remoteAuthDatasource.getCurrentFirebaseUser();
      return firebaseUser;
    } catch (e) {
      rethrow; // Propagar erro
    }
  }

  @override
  Future<UserEntity> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      // Realizar login no Firebase Auth e retornar entidade do usuário
      final firebaseUser = await _remoteAuthDatasource
          .loginWithEmailAndPassword(email: email, password: password);

      // Obter dados do Firestore
      final userData = await _removeFirestoreDatasource.getUserById(
        firebaseUser.uid,
      );
      if (userData == null) {
        throw Exception('Dados do usuário não encontrados no Firestore.');
      }
      // Sucesso
      return UserModel.fromAuthAndFirestore(firebaseUser, userData);
    } catch (e) {
      rethrow; // Propagar erro
    }
  }

  @override
  Future<UserEntity> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    // Registrar usuário no Firebase Auth
    final userCredential = await _remoteAuthDatasource
        .registerWithEmailAndPassword(email: email, password: password);

    // Criar UserModel com dados do Auth e Firestore
    final userModel = UserModel(
      id: userCredential.user!.uid,
      email: userCredential.user?.email ?? '',
      firstName: firstName,
      lastName: lastName,
      isEmailVerified: userCredential.user?.emailVerified ?? false,
    );

    // Salvar dados adicionais no Firestore
    await _removeFirestoreDatasource.addUser(userModel);

    return userModel.toEntity();
  }

  @override
  Future<void> logout() async {
    await _remoteAuthDatasource.logout();
  }

  @override
  bool isAuthenticated() {
    // Verifica se há um usuário autenticado
    return _remoteAuthDatasource.getCurrentFirebaseUser() != null;
  }

  @override
  Future<void> resendVerificationEmail() {
    return _remoteAuthDatasource.resendVerificationEmail();
  }

  @override
  Future<void> reloadCurrentUser() async {
    try {
      // Recarregar os dados do usuário do Firebase Auth
      await _remoteAuthDatasource.reloadCurrentUser();
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:gosnack_client/features/authentication/data/datasources/auth_firebase_datasource.dart';
import 'package:gosnack_client/features/authentication/data/datasources/auth_local_datasource.dart';
import 'package:gosnack_client/features/authentication/data/models/user_model.dart';
import 'package:gosnack_client/features/authentication/domain/entities/user_entity.dart';
import 'package:gosnack_client/features/authentication/domain/interfaces/authentication_repository.dart';

/// Implementação concreta do repositório de autenticação.
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  // -- Private Instance Variables ------------------------------------------ //

  // -- Datasources
  final AuthFirebaseDatasource _remoteDatasource;
  final AuthLocalDatasource _localDatasource;

  // -- Public Constructor -------------------------------------------------- //

  AuthenticationRepositoryImpl(this._remoteDatasource, this._localDatasource);

  // -- Public Override Methods --------------------------------------------- //

  @override
  UserEntity? getCurrentUser() {
    // Obter e retornar usuário do Firebase e converter para entidade
    final firebaseUser = _remoteDatasource.getCurrentFirebaseUser();
    if (firebaseUser == null) return null;
    return UserModel.fromFirebaseUser(firebaseUser).toEntity();
  }

  @override
  bool isFirstTime() {
    return _localDatasource.isFirstTime();
  }

  @override
  Future<void> setFirstTimeFalse() async {
    await _localDatasource.setFirstTimeFalse();
  }

  @override
  Future<UserEntity> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    // Realizar login no Firebase Auth e retornar entidade do usuário
    final firebaseUser = await _remoteDatasource.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel.fromFirebaseUser(firebaseUser).toEntity();
  }

  @override
  Future<void> logout() async {
    await _remoteDatasource.logout();
  }

  @override
  bool isAuthenticated() {
    // Verifica se há um usuário autenticado
    return _remoteDatasource.getCurrentFirebaseUser() != null;
  }
}

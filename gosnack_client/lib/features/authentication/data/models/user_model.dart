import 'package:firebase_auth/firebase_auth.dart';
import 'package:gosnack_client/features/authentication/domain/entities/user_entity.dart';
import 'package:gosnack_client/utils/constants/firestore/fields/user_fields.dart';

/// Modelo de dados que representa um usuário autenticado.
///
/// Estende [UserEntity] para incluir métodos de conversão.
class UserModel extends UserEntity {
  // -- Public Constructor -------------------------------------------------- //

  const UserModel({
    required super.id,
    required super.email,
    required super.firstName,
    required super.lastName,

    required super.isEmailVerified,
  });

  // -- Named Constructors -------------------------------------------------- //

  /// Cria um [UserModel] a partir do [User] do Firebase Auth
  /// e dos dados adicionais do Firestore.
  factory UserModel.fromAuthAndFirestore(User user, Map<String, dynamic> data) {
    return UserModel(
      id: user.uid,
      email: user.email ?? '',
      firstName: data[UserFields.firstName] ?? '',
      lastName: data[UserFields.lastName],
      isEmailVerified: user.emailVerified,
    );
  }

  // -- Public Methods ------------------------------------------------------ //

  /// Converte o modelo [UserModel] para a entidade de domínio [UserEntity].
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      isEmailVerified: isEmailVerified,
    );
  }

  /// Converte o modelo [UserModel] para um Map compatível com o Firestore.
  Map<String, dynamic> toFirestore() {
    return {};
  }
}

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

  /// Cria um [UserModel] a partir de um [User] do Firebase.
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      id: user.uid,
      email: user.email ?? '',
      isEmailVerified: user.emailVerified,
      // valores apenas no Firestore:
      firstName: '',
      lastName: '',
    );
  }

  /// Cria um [UserModel] a partir dos dados do Firestore.
  factory UserModel.fromFirestore(Map<String, dynamic> data, String uid) {
    return UserModel(
      id: uid,
      email: data[UserFields.email] ?? '',
      firstName: data[UserFields.firstName] ?? '',
      lastName: data[UserFields.lastName] ?? '',
      // valores apenas do Auth:
      isEmailVerified: false,
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
}

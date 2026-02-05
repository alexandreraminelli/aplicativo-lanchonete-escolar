import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gosnack_client/features/authentication/data/models/user_model.dart';
import 'package:gosnack_client/utils/constants/content/texts/error_texts.dart';
import 'package:gosnack_client/utils/constants/firestore/collections.dart';
import 'package:gosnack_client/utils/constants/firestore/fields/user_fields.dart';
import 'package:gosnack_client/utils/exceptions/firebase_exception.dart';
import 'package:gosnack_client/utils/logging/logger.dart';

/// Data Source da coleção de usuários no Firestore.
class UserFirestoreDatasource {
  // -- Instance Variables -------------------------------------------------- //

  /// Instância do Firestore.
  final FirebaseFirestore _db;

  // -- Public Constructor -------------------------------------------------- //

  UserFirestoreDatasource(this._db);

  // -- Public Methods ------------------------------------------------------ //

  /// Obter os dados do usuário pelo ID.
  Future<Map<String, dynamic>?> getUserById(String userId) async {
    try {
      // Realizar consulta no Firestore
      final doc = await _db
          .collection(FirestoreCollections.users)
          .doc(userId)
          .get();

      // Dados não encontrado
      if (!doc.exists) {
        LoggerHelp.warning(
          'Dados do usuário não encontrados no Firestore: $userId',
        );
        return null;
      }
      // Dados encontrado
      LoggerHelp.info(
        'Dados do usuário obtidos com sucesso do Firestore: $userId',
      );
      return doc.data();
    } on FirebaseException catch (e) {
      // Erro do Firebase
      LoggerHelp.error(
        'Erro ao obter usuário do Firestore: $userId, Código: ${e.code}',
      );
      throw AppFirebaseException(e.code).message;
    } catch (e) {
      // Outros erros
      LoggerHelp.error('Erro ao obter usuário do Firestore: $userId, Erro: $e');
      throw ErrorTexts.genericErrorMessage;
    }
  }

  /// Adiciona os dados do novo usuário no Firestore.
  Future<void> addUser(UserModel user) async {
    // Montar dados do usuário
    final userMap = <String, dynamic>{
      ...user.toFirestore(),
      UserFields.role: 'client',
      UserFields.createdAt: FieldValue.serverTimestamp(),
      UserFields.updatedAt: FieldValue.serverTimestamp(),
    };

    try {
      // Salvar dados do usuário usuário no Firestore
      await _db
          .collection(FirestoreCollections.users)
          .doc(user.id)
          .set(userMap);

      // Sucesso
      LoggerHelp.info(
        'Usuário adicionado com sucesso no Firestore: ${user.id}',
      );
    } on FirebaseException catch (e) {
      LoggerHelp.error(
        'Erro ao adicionar usuário no Firestore: ${user.id}, Código: ${e.code}',
      );
      throw AppFirebaseException(e.code).message;
    } catch (e) {
      LoggerHelp.error(
        'Erro ao adicionar usuário no Firestore: ${user.id}, Erro: $e',
      );
      throw ErrorTexts.genericErrorMessage;
    }
  }
}

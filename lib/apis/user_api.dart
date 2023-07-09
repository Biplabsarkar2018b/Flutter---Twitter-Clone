import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter/constants/appwrite_constants.dart';
import 'package:twitter/core/failure.dart';
import 'package:twitter/core/provider.dart';
import 'package:twitter/core/type_defs.dart';
import 'package:twitter/models/user_model.dart';

final userApiProvider = Provider((ref) {
  return UserAPI(db: ref.watch(appWriteDatabaseProvider));
});

abstract class IUserAPI {
  FutureEitherVoid saveUserData(UserModel userModel);
}

class UserAPI implements IUserAPI {
  final Databases _db;
  UserAPI({required Databases db}) : _db = db;

  @override
  FutureEitherVoid saveUserData(UserModel userModel) async {
    try {
      await _db.createDocument(
        databaseId: AppwriteConstants.DATABASE_ID,
        collectionId: AppwriteConstants.COLLECTION_ID,
        documentId: ID.unique(),
        data: userModel.toMap(),
      );
      return right(null);
    } on AppwriteException catch (e, st) {
      return left(
        Failure(e.toString(), st),
      );
    } catch (e, st) {
       return left(
        Failure(e.toString(), st),
      );
    }
  }
}

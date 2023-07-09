import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/constants/appwrite_constants.dart';

final appWriteClientProvider = Provider((ref) {
  Client client = Client();
  return client
      .setEndpoint(AppwriteConstants.ENDPOINT)
      .setProject(AppwriteConstants.PROJECT_ID)
      .setSelfSigned(status: true);
});

final appWriteAccountProvider = Provider((ref) {
  final client = ref.watch(appWriteClientProvider);
  return Account(client);
});

final appWriteDatabaseProvider = Provider((ref) {
  final client = ref.watch(appWriteClientProvider);
  final db = Databases(client);
  return db;
});

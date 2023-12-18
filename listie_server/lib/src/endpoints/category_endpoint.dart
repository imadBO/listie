import 'package:listie_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CategoryEndpoint extends Endpoint {
  Future<List<Category>> listCategories(Session session) async {
    final list = await Category.find(session);
    return list;
  }
}

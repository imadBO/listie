import 'package:listie_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CategoryItemEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<void> addItemToCategory(
    Session session, {
    required CategoryItems item,
  }) async {
    await CategoryItems.insert(session, item);
  }

  Future<List<CategoryItems>> getItemsByCategory(Session session,
      {required int categoryId, required int userId}) async {
    final items = await CategoryItems.find(
      session,
      where: (item) {
        return item.categoryId.equals(categoryId) & item.userId.equals(userId);
      },
    );
    return items;
  }

  Future<List<CategoryItems>> listAllItems(
    Session session, {
    required int? userId,
  }) async {
    if (userId == null) {
      return [];
    }
    return await CategoryItems.find(
      session,
      where: (item) {
        return item.userId.equals(userId);
      },
      orderBy: ColumnInt('id'),
    );
  }

  Future<bool> toggleIsChecked(
    Session session, {
    required CategoryItems item,
  }) async {
    item.isChecked = !item.isChecked;
    return await session.db.update(item);
  }

  Future<bool> updateItem(
    Session session, {
    required CategoryItems item,
    required String newName,
  }) async {
    item.name = newName;
    return await session.db.update(item);
  }

  Future<bool> deleteItem(
    Session session, {
    required CategoryItems item,
  }) async {
    return await CategoryItems.deleteRow(session, item);
  }
}

/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class CategoryItems extends _i1.TableRow {
  CategoryItems({
    int? id,
    required this.userId,
    required this.name,
    required this.categoryId,
    required this.isChecked,
  }) : super(id);

  factory CategoryItems.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return CategoryItems(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      categoryId: serializationManager
          .deserialize<int>(jsonSerialization['categoryId']),
      isChecked: serializationManager
          .deserialize<bool>(jsonSerialization['isChecked']),
    );
  }

  static final t = CategoryItemsTable();

  int userId;

  String name;

  int categoryId;

  bool isChecked;

  @override
  String get tableName => 'categoryitems';

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'categoryId': categoryId,
      'isChecked': isChecked,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'categoryId': categoryId,
      'isChecked': isChecked,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'categoryId': categoryId,
      'isChecked': isChecked,
    };
  }

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'userId':
        userId = value;
        return;
      case 'name':
        name = value;
        return;
      case 'categoryId':
        categoryId = value;
        return;
      case 'isChecked':
        isChecked = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<CategoryItems>> find(
    _i1.Session session, {
    CategoryItemsExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<CategoryItems>(
      where: where != null ? where(CategoryItems.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<CategoryItems?> findSingleRow(
    _i1.Session session, {
    CategoryItemsExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<CategoryItems>(
      where: where != null ? where(CategoryItems.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<CategoryItems?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<CategoryItems>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required CategoryItemsExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CategoryItems>(
      where: where(CategoryItems.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    CategoryItems row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    CategoryItems row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    CategoryItems row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    CategoryItemsExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CategoryItems>(
      where: where != null ? where(CategoryItems.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef CategoryItemsExpressionBuilder = _i1.Expression Function(
    CategoryItemsTable);

class CategoryItemsTable extends _i1.Table {
  CategoryItemsTable() : super(tableName: 'categoryitems');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final userId = _i1.ColumnInt('userId');

  final name = _i1.ColumnString('name');

  final categoryId = _i1.ColumnInt('categoryId');

  final isChecked = _i1.ColumnBool('isChecked');

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        name,
        categoryId,
        isChecked,
      ];
}

@Deprecated('Use CategoryItemsTable.t instead.')
CategoryItemsTable tCategoryItems = CategoryItemsTable();

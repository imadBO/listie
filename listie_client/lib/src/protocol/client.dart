/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:listie_client/src/protocol/category.dart' as _i3;
import 'package:listie_client/src/protocol/category_items.dart' as _i4;
import 'package:serverpod_auth_client/module.dart' as _i5;
import 'dart:io' as _i6;
import 'protocol.dart' as _i7;

class _EndpointCategory extends _i1.EndpointRef {
  _EndpointCategory(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'category';

  _i2.Future<List<_i3.Category>> listCategories() =>
      caller.callServerEndpoint<List<_i3.Category>>(
        'category',
        'listCategories',
        {},
      );
}

class _EndpointCategoryItem extends _i1.EndpointRef {
  _EndpointCategoryItem(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'categoryItem';

  _i2.Future<void> addItemToCategory({required _i4.CategoryItems item}) =>
      caller.callServerEndpoint<void>(
        'categoryItem',
        'addItemToCategory',
        {'item': item},
      );

  _i2.Future<List<_i4.CategoryItems>> getItemsByCategory({
    required int categoryId,
    required int userId,
  }) =>
      caller.callServerEndpoint<List<_i4.CategoryItems>>(
        'categoryItem',
        'getItemsByCategory',
        {
          'categoryId': categoryId,
          'userId': userId,
        },
      );

  _i2.Future<List<_i4.CategoryItems>> listAllItems({required int? userId}) =>
      caller.callServerEndpoint<List<_i4.CategoryItems>>(
        'categoryItem',
        'listAllItems',
        {'userId': userId},
      );

  _i2.Future<void> toggleIsChecked({required _i4.CategoryItems item}) =>
      caller.callServerEndpoint<void>(
        'categoryItem',
        'toggleIsChecked',
        {'item': item},
      );
}

class _EndpointExample extends _i1.EndpointRef {
  _EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i5.Caller(client);
  }

  late final _i5.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i6.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i7.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    category = _EndpointCategory(this);
    categoryItem = _EndpointCategoryItem(this);
    example = _EndpointExample(this);
    modules = _Modules(this);
  }

  late final _EndpointCategory category;

  late final _EndpointCategoryItem categoryItem;

  late final _EndpointExample example;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'category': category,
        'categoryItem': categoryItem,
        'example': example,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}

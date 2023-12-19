/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/category_endpoint.dart' as _i2;
import '../endpoints/category_items_endpoint.dart' as _i3;
import '../endpoints/example_endpoint.dart' as _i4;
import 'package:listie_server/src/generated/category_items.dart' as _i5;
import 'package:serverpod_auth_server/module.dart' as _i6;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'category': _i2.CategoryEndpoint()
        ..initialize(
          server,
          'category',
          null,
        ),
      'categoryItem': _i3.CategoryItemEndpoint()
        ..initialize(
          server,
          'categoryItem',
          null,
        ),
      'example': _i4.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
    };
    connectors['category'] = _i1.EndpointConnector(
      name: 'category',
      endpoint: endpoints['category']!,
      methodConnectors: {
        'listCategories': _i1.MethodConnector(
          name: 'listCategories',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i2.CategoryEndpoint)
                  .listCategories(session),
        )
      },
    );
    connectors['categoryItem'] = _i1.EndpointConnector(
      name: 'categoryItem',
      endpoint: endpoints['categoryItem']!,
      methodConnectors: {
        'addItemToCategory': _i1.MethodConnector(
          name: 'addItemToCategory',
          params: {
            'item': _i1.ParameterDescription(
              name: 'item',
              type: _i1.getType<_i5.CategoryItems>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['categoryItem'] as _i3.CategoryItemEndpoint)
                  .addItemToCategory(
            session,
            item: params['item'],
          ),
        ),
        'getItemsByCategory': _i1.MethodConnector(
          name: 'getItemsByCategory',
          params: {
            'categoryId': _i1.ParameterDescription(
              name: 'categoryId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['categoryItem'] as _i3.CategoryItemEndpoint)
                  .getItemsByCategory(
            session,
            categoryId: params['categoryId'],
            userId: params['userId'],
          ),
        ),
        'listAllItems': _i1.MethodConnector(
          name: 'listAllItems',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['categoryItem'] as _i3.CategoryItemEndpoint)
                  .listAllItems(
            session,
            userId: params['userId'],
          ),
        ),
        'toggleIsChecked': _i1.MethodConnector(
          name: 'toggleIsChecked',
          params: {
            'item': _i1.ParameterDescription(
              name: 'item',
              type: _i1.getType<_i5.CategoryItems>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['categoryItem'] as _i3.CategoryItemEndpoint)
                  .toggleIsChecked(
            session,
            item: params['item'],
          ),
        ),
        'updateItem': _i1.MethodConnector(
          name: 'updateItem',
          params: {
            'item': _i1.ParameterDescription(
              name: 'item',
              type: _i1.getType<_i5.CategoryItems>(),
              nullable: false,
            ),
            'newName': _i1.ParameterDescription(
              name: 'newName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['categoryItem'] as _i3.CategoryItemEndpoint)
                  .updateItem(
            session,
            item: params['item'],
            newName: params['newName'],
          ),
        ),
        'deleteItem': _i1.MethodConnector(
          name: 'deleteItem',
          params: {
            'item': _i1.ParameterDescription(
              name: 'item',
              type: _i1.getType<_i5.CategoryItems>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['categoryItem'] as _i3.CategoryItemEndpoint)
                  .deleteItem(
            session,
            item: params['item'],
          ),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i4.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i6.Endpoints()..initializeEndpoints(server);
  }
}

import 'package:listie_client/listie_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

abstract class ApiClient {
  late SessionManager sessionManager;
  late Client client;
  Future<void> init();
}

class ApiClientImpl extends ApiClient {
  @override
  Future<void> init() async {
    client = Client(
      'http://localhost:8080/',
      authenticationKeyManager: FlutterAuthenticationKeyManager(),
    )..connectivityMonitor = FlutterConnectivityMonitor();

    // sessionManager = SessionManager(caller: client.modules.auth);
    // await sessionManager.initialize();
    throw UnimplementedError();
  }
}

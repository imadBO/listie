import 'package:get_it/get_it.dart';
import 'package:listie_flutter/core/api_client.dart';

GetIt singleton = GetIt.instance;

Future<void> initSingletons() async {
  singleton.registerSingleton<ApiClient>(ApiClientImpl());
  await singleton<ApiClient>().init();
}

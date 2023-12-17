import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listie_flutter/core/api_client.dart';
import 'package:listie_flutter/core/singletons.dart';

class SessionCubit extends Cubit<bool> {
  SessionCubit() : super(false);

  final sessionManager = singleton<ApiClient>().sessionManager;
  final client = singleton<ApiClient>().client;
  static SessionCubit get(context) => BlocProvider.of(context);

  bool isAuthenticated() {
    return sessionManager.isSignedIn;
  }

  dynamic getUser() {
    return sessionManager.signedInUser;
  }

  void updateState() {
    if (isAuthenticated()) {
      emit(true);
    } else {
      emit(false);
    }
  }

  Future<void> logout() async {
    await sessionManager.signOut();
    updateState();
  }
}

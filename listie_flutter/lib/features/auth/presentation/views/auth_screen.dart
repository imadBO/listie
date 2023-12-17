import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listie_flutter/core/api_client.dart';
import 'package:listie_flutter/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:listie_flutter/core/singletons.dart';
import 'package:listie_flutter/utils/strings_manager.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SessionCubit, bool>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        SessionCubit sessionCubit = SessionCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(StringsManager.welcome),
          ),
          body: Center(
            child: SignInWithEmailButton(
              caller: singleton<ApiClient>().client.modules.auth,
              onSignedIn: () {
                sessionCubit.updateState();
              },
              onFailure: () {},
            ),
          ),
        );
      },
    );
  }
}

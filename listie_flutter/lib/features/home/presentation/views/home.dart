import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listie_flutter/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:listie_flutter/features/auth/presentation/views/auth_screen.dart';
import 'package:listie_flutter/features/dashboard/presentation/views/dashboard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SessionCubit, bool>(
      listener: (context, state) {},
      builder: (context, state) {
        SessionCubit sessionCubit = SessionCubit.get(context);

        return sessionCubit.isAuthenticated()
            ? const DashboardScreen()
            : const AuthScreen();
      },
    );
  }
}

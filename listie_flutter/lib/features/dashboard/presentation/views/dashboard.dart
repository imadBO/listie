import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listie_flutter/features/auth/presentation/cubits/auth_cubit.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SessionCubit, bool>(
        listener: (context, state) {},
        builder: (context, state) {
          SessionCubit sessionCubit = SessionCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    sessionCubit.logout();
                  },
                  icon: const Icon(Icons.logout_outlined),
                ),
              ],
            ),
            body: const Center(
              child: Text("Welcome back"),
            ),
          );
        });
  }
}

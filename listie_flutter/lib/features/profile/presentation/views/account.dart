import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listie_flutter/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:listie_flutter/utils/colors_manager.dart';
import 'package:listie_flutter/utils/strings_manager.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SessionCubit, bool>(
        listener: (context, state) {},
        builder: (context, state) {
          SessionCubit sessionCubit = SessionCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(StringsManager.myAccount),
            ),
            body: ListView(
              children: [
                DecoratedBox(
                  decoration: const BoxDecoration(color: ColorsManager.black),
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text("user name"),
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    onTap: () {},
                  ),
                ),
                const SizedBox(height: 1),
                DecoratedBox(
                  decoration: const BoxDecoration(color: ColorsManager.black),
                  child: ListTile(
                    leading: const Icon(Icons.logout, color: ColorsManager.red),
                    titleTextStyle: const TextStyle(color: ColorsManager.red),
                    title: const Text(StringsManager.logoutLabel),
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    onTap: () {
                      sessionCubit.logout();
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}

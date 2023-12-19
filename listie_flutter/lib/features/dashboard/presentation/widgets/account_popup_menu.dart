import 'package:flutter/material.dart';
import 'package:listie_flutter/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:listie_flutter/utils/colors_manager.dart';
import 'package:listie_flutter/utils/routes_manager.dart';
import 'package:listie_flutter/utils/strings_manager.dart';

class AccountPopupMenu extends StatelessWidget {
  const AccountPopupMenu({
    super.key,
    required this.sessionCubit,
  });

  final SessionCubit sessionCubit;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const CircleAvatar(
        radius: 15,
        child: Icon(Icons.person),
      ),
      onSelected: (value) {
        switch (value) {
          case '0':
            Navigator.of(context).pushNamed(Routes.accountScreen);
            break;
          case '1':
            sessionCubit.logout();
            break;
        }
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: '0',
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(sessionCubit.getUser().userName),
              dense: true,
              visualDensity: VisualDensity.compact,
            ),
          ),
          const PopupMenuItem(
            value: '1',
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: ColorsManager.red,
              ),
              titleTextStyle: TextStyle(
                color: ColorsManager.red,
              ),
              title: Text(StringsManager.logoutLabel),
              dense: true,
              visualDensity: VisualDensity.compact,
            ),
          ),
        ];
      },
    );
  }
}

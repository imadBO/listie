import 'package:flutter/material.dart';
import 'package:listie_flutter/features/dashboard/presentation/cubits/category_cubit.dart';
import 'package:listie_flutter/utils/strings_manager.dart';

class ItemFormDialog extends StatelessWidget {
  const ItemFormDialog({
    super.key,
    required this.categoryCubit,
    this.oldName,
  });

  final CategoryCubit categoryCubit;
  final String? oldName;

  @override
  Widget build(BuildContext context) {
    if (oldName != null) {
      categoryCubit.newItemController.text = oldName!;
    }
    return AlertDialog(
      content: TextFormField(
        controller: categoryCubit.newItemController,
        decoration: const InputDecoration(
          hintText: StringsManager.addItemLabel,
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(StringsManager.cancelLabel),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(
              categoryCubit.newItemController.text,
            );
          },
          child: const Text(StringsManager.addLabel),
        ),
      ],
    );
  }
}

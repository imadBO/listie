import 'package:flutter/material.dart';
import 'package:listie_client/listie_client.dart';
import 'package:listie_flutter/features/dashboard/presentation/cubits/category_cubit.dart';
import 'package:listie_flutter/features/dashboard/presentation/widgets/item_form_widget.dart';
import 'package:listie_flutter/utils/colors_manager.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
    required this.item,
    required this.cubit,
  });

  final CategoryItems item;
  final CategoryCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.id.toString()),
      background: const DecoratedBox(
        decoration: BoxDecoration(color: ColorsManager.red),
      ),
      onDismissed: (direction) {
        cubit.deleteItem(item);
      },
      child: ListTile(
        title: Text(item.name),
        trailing: Checkbox.adaptive(
          value: item.isChecked,
          onChanged: (val) {
            cubit.toggleIsChecked(item);
          },
        ),
        onLongPress: () async {
          final String? newName = await showAdaptiveDialog(
            context: context,
            builder: (context) {
              return ItemFormDialog(categoryCubit: cubit, oldName: item.name);
            },
          );
          cubit.newItemController.clear();
          if (newName != null &&
              newName.trim().isNotEmpty &&
              newName.trim() != item.name) {
            cubit.updateItem(item, newName);
          }
        },
        dense: true,
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}

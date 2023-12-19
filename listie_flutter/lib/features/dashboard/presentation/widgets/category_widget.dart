import 'package:flutter/material.dart';
import 'package:listie_client/listie_client.dart';
import 'package:listie_flutter/features/dashboard/presentation/cubits/category_cubit.dart';
import 'package:listie_flutter/features/dashboard/presentation/widgets/category_item_widget.dart';
import 'package:listie_flutter/features/dashboard/presentation/widgets/item_form_widget.dart';
import 'package:listie_flutter/utils/colors_manager.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.category,
    required this.categoryCubit,
    required this.items,
  });

  final Category category;
  final CategoryCubit categoryCubit;
  final List<CategoryItems> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(color: ColorsManager.black),
          child: ListTile(
            title: Text(category.name),
            trailing: IconButton(
              onPressed: () async {
                final String? itemName = await showAdaptiveDialog(
                  context: context,
                  builder: (context) {
                    return ItemFormDialog(categoryCubit: categoryCubit);
                  },
                );
                categoryCubit.newItemController.clear();
                if (itemName != null && itemName.trim().isNotEmpty) {
                  categoryCubit.addItemToCategory(itemName, category.id!);
                }
              },
              icon: const Icon(Icons.add),
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return CategoryItemWidget(
              item: items[index],
              cubit: categoryCubit,
            );
          },
          itemCount: items.length,
        ),
      ],
    );
  }
}

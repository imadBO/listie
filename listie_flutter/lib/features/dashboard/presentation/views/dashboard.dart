import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listie_client/listie_client.dart';
import 'package:listie_flutter/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:listie_flutter/features/dashboard/presentation/cubits/category_cubit.dart';
import 'package:listie_flutter/utils/colors_manager.dart';
import 'package:listie_flutter/utils/strings_manager.dart';

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
          body: BlocConsumer<CategoryCubit, CategoryStates>(
            listener: (context, state) {},
            builder: (context, state) {
              CategoryCubit categoryCubit = CategoryCubit.get(context);
              final categories = categoryCubit.categories;
              return categoryCubit.categoriesLoading
                  ? const CircularProgressIndicator()
                  : categories.isEmpty
                      ? const Center(
                          child: Text(StringsManager.categoriesEmpty),
                        )
                      : ListView.builder(
                          itemBuilder: (context, index) {
                            return CategoryWidget(
                              category: categories[index],
                              categoryCubit: categoryCubit,
                              items: categoryCubit.filterByCategory(
                                categories[index].id!,
                              ),
                            );
                          },
                          itemCount: categories.length,
                        );
            },
          ),
        );
      },
    );
  }
}

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
    return ListTile(
      title: Text(item.name),
      trailing: Checkbox.adaptive(
        value: item.isChecked,
        onChanged: (val) {
          cubit.toggleIsChecked(item);
        },
      ),
      dense: true,
      visualDensity: VisualDensity.compact,
    );
  }
}

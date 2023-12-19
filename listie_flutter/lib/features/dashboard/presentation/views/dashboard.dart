import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listie_flutter/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:listie_flutter/features/dashboard/presentation/cubits/category_cubit.dart';
import 'package:listie_flutter/features/dashboard/presentation/widgets/category_widget.dart';
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

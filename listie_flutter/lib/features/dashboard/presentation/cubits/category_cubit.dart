import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listie_client/listie_client.dart';
import 'package:listie_flutter/core/api_client.dart';
import 'package:listie_flutter/core/singletons.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(InitCategoryState()) {
    fetchCategories();
    fetchCategoryItems();
  }
  bool categoriesLoading = false;
  List<Category> categories = [];
  List<CategoryItems> items = [];
  TextEditingController newItemController = TextEditingController();
  final userId = singleton<ApiClient>().sessionManager.signedInUser?.id;
  final categoryEndpoint = singleton<ApiClient>().client.category;
  final categoryItemEndpoint = singleton<ApiClient>().client.categoryItem;

  static CategoryCubit get(context) => BlocProvider.of(context);

  Future<void> fetchCategories() async {
    categoriesLoading = true;
    emit(LoadingCategoryState());
    try {
      categories = await categoryEndpoint.listCategories();
      emit(FetchedSuccessCategoryState());
    } catch (error) {
      emit(FetchedFailureCategoryState(error: error.toString()));
    }
    categoriesLoading = false;
    emit(LoadingCategoryState());
  }

  Future<void> fetchCategoryItems() async {
    try {
      items = await categoryItemEndpoint.listAllItems(userId: userId);
      emit(FetchedSuccessCategoryItemsState());
    } catch (error) {
      emit(FetchedFailureCategoryItemsState(error: error.toString()));
    }
  }

  List<CategoryItems> filterByCategory(int categoryId) {
    List<CategoryItems> filterd = [];
    for (CategoryItems item in items) {
      if (categoryId == item.categoryId) {
        filterd.add(item);
      }
    }
    return filterd;
  }

  Future<void> addItemToCategory(String name, int categoryId) async {
    try {
      await categoryItemEndpoint.addItemToCategory(
        item: CategoryItems(
          userId: userId!,
          name: name,
          categoryId: categoryId,
          isChecked: false,
        ),
      );
      fetchCategoryItems();
      emit(AddedSuccessCategoryItemState());
    } catch (error) {
      emit(AddedFailureCategoryItemState(error: error.toString()));
    }
  }

  Future<void> toggleIsChecked(CategoryItems item) async {
    try {
      await categoryItemEndpoint.toggleIsChecked(item: item);
      fetchCategoryItems();
      emit(UpdateSuccessCategoryItemState());
    } catch (error) {
      emit(UpdateFailureCategoryItemState(error: error.toString()));
    }
  }

  Future<void> updateItem(CategoryItems item, String newName) async {
    try {
      await categoryItemEndpoint.updateItem(item: item, newName: newName);
      fetchCategoryItems();
      emit(UpdateSuccessCategoryItemState());
    } catch (error) {
      emit(UpdateFailureCategoryItemState(error: error.toString()));
    }
  }

  Future<void> deleteItem(CategoryItems item) async {
    try {
      await categoryItemEndpoint.deleteItem(item: item);
      fetchCategoryItems();
      emit(DeleteSuccessCategoryItemState());
    } catch (error) {
      emit(DeleteFailureCategoryItemState(error: error.toString()));
    }
  }
}

// States of the CategoryCubit

abstract class CategoryStates {}

class InitCategoryState extends CategoryStates {}

class FetchedSuccessCategoryState extends CategoryStates {}

class FetchedFailureCategoryState extends CategoryStates {
  FetchedFailureCategoryState({required this.error});
  final String error;
}

class LoadingCategoryState extends CategoryStates {}

class FetchedSuccessCategoryItemsState extends CategoryStates {}

class FetchedFailureCategoryItemsState extends CategoryStates {
  FetchedFailureCategoryItemsState({required this.error});
  final String error;
}

class LoadingCategoryItemsState extends CategoryStates {}

class AddedSuccessCategoryItemState extends CategoryStates {}

class AddedFailureCategoryItemState extends CategoryStates {
  AddedFailureCategoryItemState({required this.error});
  final String error;
}

class UpdateSuccessCategoryItemState extends CategoryStates {}

class UpdateFailureCategoryItemState extends CategoryStates {
  UpdateFailureCategoryItemState({required this.error});
  final String error;
}

class DeleteSuccessCategoryItemState extends CategoryStates {}

class DeleteFailureCategoryItemState extends CategoryStates {
  DeleteFailureCategoryItemState({required this.error});
  final String error;
}

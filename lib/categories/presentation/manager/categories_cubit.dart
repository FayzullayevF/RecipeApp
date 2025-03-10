import 'package:chef_staff/categories/data/repositories/categories_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/categories_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({required CategoriesRepository repo})
      : _repo = repo,
        super(
          CategoriesState(
              categories: [],
              mainCategory: null,
              status: CategoriesStatus.loading),
        ) {
    load();
  }

  final CategoriesRepository _repo;

  Future<void> load() async {
    final allCategories = await _repo.fetchCategories();
    emit(
      CategoriesState(
        categories: allCategories.where((category) => !category.main).toList(),
        mainCategory: allCategories.firstWhere((category) => category.main),
        status: CategoriesStatus.idle,
      ),
    );
  }
}

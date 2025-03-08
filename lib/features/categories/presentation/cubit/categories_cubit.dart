import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheta_store/features/categories/domain/repo/categories_repo_interface.dart';
import 'package:sheta_store/features/categories/presentation/cubit/states/categories_error_state.dart';
import 'package:sheta_store/features/categories/presentation/cubit/states/categories_initial_state.dart';
import 'package:sheta_store/features/categories/presentation/cubit/states/categories_loading_state.dart';
import 'package:sheta_store/features/categories/presentation/cubit/states/categories_state.dart';
import 'package:sheta_store/features/categories/presentation/cubit/states/categories_success_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepoInterface categoriesRepo;
  CategoriesCubit(this.categoriesRepo) : super(CategoriesInitialState());
  Future getCategories() async {
    emit(CategoriesLoadingState());

    final categories = await categoriesRepo.getCategories();

    if (categories.$1 == null) {
      emit(CategoriesSuccessState(categories: categories.$2));
    } else {
      emit(CategoriesErrorState(errorMessage: categories.$1!.message));
    }
  }
}

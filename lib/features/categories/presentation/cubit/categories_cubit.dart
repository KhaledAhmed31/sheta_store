import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sheta_store/features/categories/domain/use_cases/get_categories.dart';
import 'package:sheta_store/features/categories/presentation/cubit/states/categories_error_state.dart';
import 'package:sheta_store/features/categories/presentation/cubit/states/categories_initial_state.dart';
import 'package:sheta_store/features/categories/presentation/cubit/states/categories_loading_state.dart';
import 'package:sheta_store/features/categories/presentation/cubit/states/categories_state.dart';
import 'package:sheta_store/features/categories/presentation/cubit/states/categories_success_state.dart';

@lazySingleton
class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUseCase categoryUseCase;
  CategoriesCubit(this.categoryUseCase) : super(CategoriesInitialState()){
    getCategories();
  }
  Future<void> getCategories() async {
    emit(CategoriesLoadingState());

    var categories = await categoryUseCase();

    if (categories.$1 == null) {
      emit(CategoriesSuccessState(categories: categories.$2));
    } else {
      emit(CategoriesErrorState(errorMessage: categories.$1!.message));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sheta_store/features/categories/domain/use_cases/get_categories.dart';
import 'package:sheta_store/features/categories/domain/use_cases/get_sub_categories_use_case.dart';
import 'package:sheta_store/features/categories/presentation/cubit/states/categories_error_state.dart';
import 'package:sheta_store/features/categories/presentation/cubit/states/categories_initial_state.dart';
import 'package:sheta_store/features/categories/presentation/cubit/states/categories_loading_state.dart';
import 'package:sheta_store/features/categories/presentation/cubit/states/categories_state.dart';
import 'package:sheta_store/features/categories/presentation/cubit/states/categories_success_state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUseCase categoryUseCase;
  final GetSubCategoriesUseCase subCategoriesUseCase;
  CategoriesCubit(this.categoryUseCase, this.subCategoriesUseCase) : super(CategoriesInitialState()){
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


  Future<void> getSubCategories(String id) async {
    emit(SubCategoriesLoadingState());

    var subCategories = await subCategoriesUseCase(id); 

    if (subCategories.$1 == null) {
      emit(SubCategoriesSuccessState(subCategories: subCategories.$2));
    } else {
      emit(SubCategoriesErrorState(errorMessage: subCategories.$1!.message));
    }
  }
}

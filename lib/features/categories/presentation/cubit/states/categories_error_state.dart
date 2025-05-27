import 'package:sheta_store/features/categories/presentation/cubit/states/categories_state.dart';

class CategoriesErrorState implements CategoriesState{
  final String errorMessage;
  CategoriesErrorState({required this.errorMessage});
}

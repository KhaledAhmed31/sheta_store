import 'categories_state.dart';

class CategoriesErrorState implements CategoriesState{
  final String errorMessage;
  CategoriesErrorState({required this.errorMessage});
}

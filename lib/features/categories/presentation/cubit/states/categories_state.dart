import '../../../domain/entities/category_entity.dart';

abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class SubCategoriesLoadingState extends CategoriesState {}

class SubCategoriesSuccessState extends CategoriesState {
  final List<CategoryEntity> subCategories;
  SubCategoriesSuccessState({required this.subCategories});
}

class SubCategoriesErrorState extends CategoriesState {
  final String errorMessage;
  SubCategoriesErrorState({required this.errorMessage});
}
part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

class ProductsFetched extends ProductsEvent{}

class ProductsCategoryFetched extends ProductsEvent{

  final String category;

  ProductsCategoryFetched(this.category);
}

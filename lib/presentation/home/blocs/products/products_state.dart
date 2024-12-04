part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState{}

class ProductsSuccess extends ProductsState{
  final List<Product> products;

  ProductsSuccess(this.products);
}

class ProductsFailed extends ProductsState{
  final String message;

  ProductsFailed({required this.message});
}



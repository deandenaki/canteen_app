import 'package:bloc/bloc.dart';
import 'package:canteen_app/core/constants/constants.dart';
import 'package:canteen_app/data/dataresource/product_remote_datasource.dart';
import 'package:canteen_app/data/model/response/product_response_model.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRemoteDatasouce productRemoteDatasouce;
  List<Product> products = [];

  ProductsBloc(this.productRemoteDatasouce) : super(ProductsInitial()) {
    on<ProductsFetched>((event, emit) async {
      emit(ProductsLoading());

      final response = await productRemoteDatasouce.getProducts();

      response.fold(
              (l) => emit(ProductsFailed(message: l)),
              (r) {
            products = r.products;
            emit(ProductsSuccess(products));
          }
      );
    });

    on<ProductsCategoryFetched>((event, emit) async {
      emit(ProductsLoading());

      final response = await productRemoteDatasouce.getProducts();

      final filtered = event.category == 'all' ? products : products
      .where((element) => element.category == event.category)
      .toList();

      response.fold(
              (l) => emit(ProductsFailed(message: l)),
              (r) => emit(ProductsSuccess(filtered))
      );
    });
  }
}

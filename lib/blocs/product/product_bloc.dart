import 'package:bloc/bloc.dart';
import 'package:program/blocs/product/product_event.dart';
import 'package:program/blocs/product/product_state.dart';
class ProductBloc extends Bloc<ProductEvent,ProductState>{
ProductBloc():super(ProductInitial()){
  on<AddProduct>((event, emit) async {
    emit(ProductLoading());
    try {
      await Future.delayed(Duration(seconds: 1)); // Simulate saving
      emit(ProductSuccess(event.product));
    } catch (e) {
      emit(ProductFailure('Failed to add product'));
    }
  });
}}
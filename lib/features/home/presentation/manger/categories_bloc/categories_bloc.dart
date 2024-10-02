import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/use_cases/get_categories_use_case.dart';
part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoriesBloc(this.getCategoriesUseCase) : super(CategoriesInitial()) {
    on<GetCategoriesEvent>(getCategories);
    on<SelectCategoryEvent>(selectCategory);
  }

  Future getCategories(
      GetCategoriesEvent event, Emitter<CategoriesState> emit) async {
    emit(CategoryLoading());
    final result = await getCategoriesUseCase.call();
    result.fold((failure) {
      emit(CategoriesFailure(err: failure.msg));
    }, (categories) {
      emit(CategorySuccess(categories: categories));
    });
  }

  Future selectCategory(
      SelectCategoryEvent event, Emitter<CategoriesState> emit) async {
    final currentState = state;
    if (currentState is CategorySuccess) {
      if (currentState.selectedIndex == event.selectedIndex) {
        emit(CategorySuccess(
            categories: currentState.categories, selectedIndex: null));
      } else {
        emit(CategorySuccess(
            categories: currentState.categories,
            selectedIndex: event.selectedIndex));
      }
    }
  }
}

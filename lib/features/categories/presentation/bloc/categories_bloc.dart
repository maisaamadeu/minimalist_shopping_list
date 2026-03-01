import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimalist_shopping_list/core/usecase/usecase.dart';
import 'package:minimalist_shopping_list/features/categories/domain/usecases/create_category_usecase.dart';
import 'package:minimalist_shopping_list/features/categories/domain/usecases/delete_category_usecase.dart';
import 'package:minimalist_shopping_list/features/categories/domain/usecases/get_all_categories_usecase.dart';
import 'package:minimalist_shopping_list/features/categories/domain/usecases/update_category_usecase.dart';
import 'package:minimalist_shopping_list/features/categories/presentation/bloc/categories_event.dart';
import 'package:minimalist_shopping_list/features/categories/presentation/bloc/categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CreateCategoryUsecase _createCategoryUsecase;
  final DeleteCategoryUsecase _deleteCategoryUsecase;
  final GetAllCategoriesUsecase _getAllCategoriesUsecase;
  final UpdateCategoryUsecase _updateCategoryUsecase;

  CategoriesBloc(
    this._createCategoryUsecase,
    this._deleteCategoryUsecase,
    this._getAllCategoriesUsecase,
    this._updateCategoryUsecase,
  ) : super(CategoriesInitial()) {
    on<CreateCategoryRequested>(_onCreateCategoryRequested);
    on<DeleteCategoryRequested>(_onDeleteCategoryRequested);
    on<LoadCategoriesRequested>(_loadCategoriesRequested);
    on<UpdateCategoryRequested>(_onUpdateCategoryRequested);
  }

  Future<void> _onCreateCategoryRequested(
    CreateCategoryRequested event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(CategoriesLoading());
    final result = await _createCategoryUsecase(event.params);
    result.fold(
      (failure) => emit(CategoriesError(failure.message)),
      (success) => emit(CategoriesActionSuccess()),
    );
  }

  Future<void> _onDeleteCategoryRequested(
    DeleteCategoryRequested event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(CategoriesLoading());
    final result = await _deleteCategoryUsecase(event.params);
    result.fold(
      (failure) => emit(CategoriesError(failure.message)),
      (success) => emit(CategoriesActionSuccess()),
    );
  }

  Future<void> _loadCategoriesRequested(
    LoadCategoriesRequested event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(CategoriesLoading());
    final result = await _getAllCategoriesUsecase(NoParams());
    result.fold(
      (failure) => emit(CategoriesError(failure.message)),
      (success) => emit(CategoriesLoaded(success)),
    );
  }

  Future<void> _onUpdateCategoryRequested(
    UpdateCategoryRequested event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(CategoriesLoading());
    final result = await _updateCategoryUsecase(event.params);
    result.fold(
      (failure) => emit(CategoriesError(failure.message)),
      (success) => emit(CategoriesActionSuccess()),
    );
  }
}

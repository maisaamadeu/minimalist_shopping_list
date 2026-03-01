import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimalist_shopping_list/core/design_system/widgets/base_app_bar.dart';
import 'package:minimalist_shopping_list/features/categories/domain/params/create_category_params.dart';
import 'package:minimalist_shopping_list/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:minimalist_shopping_list/features/categories/presentation/bloc/categories_event.dart';
import 'package:minimalist_shopping_list/features/categories/presentation/bloc/categories_state.dart';
import 'package:minimalist_shopping_list/features/categories/presentation/widgets/create_category_dialog.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: const Text('Categorias'),
        automaticallyImplyLeading: false,
        showBackButton: false,
      ),
      body: BlocConsumer<CategoriesBloc, CategoriesState>(
        listener: (context, state) {
          if (state is CategoriesError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }

          if (state is CategoriesActionSuccess) {
            context.read<CategoriesBloc>().add(LoadCategoriesRequested());
          }
        },
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategoriesLoaded) {
            if (state.categories.isEmpty) {
              return const Center(child: Text('Nenhuma categoria encontrada.'));
            } else {
              return ListView.builder(
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  final category = state.categories[index];
                  return ListTile(
                    title: Text(category.name),
                    leading: category.imagePath != null
                        ? Image.file(
                            File(category.imagePath!),
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          )
                        : null,
                  );
                },
              );
            }
          } else if (state is CategoriesError) {
            return const Center(child: Text('Erro ao carregar categorias.'));
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateCategoryDialog(context),
        elevation: 0,
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _showCreateCategoryDialog(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (context) => const CreateCategoryDialog(),
    );

    if (result != null && context.mounted && result is CreateCategoryParams) {
      context.read<CategoriesBloc>().add(CreateCategoryRequested(result));
    }
  }
}

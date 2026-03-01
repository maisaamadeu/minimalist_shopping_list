import 'package:flutter/material.dart';
import 'package:minimalist_shopping_list/core/design_system/widgets/inputs/base_input.dart';
import 'package:minimalist_shopping_list/features/categories/domain/params/create_category_params.dart';
import 'package:minimalist_shopping_list/features/categories/presentation/widgets/image_picker_input.dart';

class CreateCategoryDialog extends StatefulWidget {
  const CreateCategoryDialog({super.key});

  @override
  State<CreateCategoryDialog> createState() => _CreateCategoryDialogState();
}

class _CreateCategoryDialogState extends State<CreateCategoryDialog> {
  CreateCategoryParams _params = CreateCategoryParams(name: '', image: null);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Nova Categoria'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: ImagePickerInput(
              onImageSelected: (image) =>
                  _params = _params.copyWith(image: image),
            ),
          ),
          BaseInput(
            hintText: 'Nome',
            onChanged: (value) => _params = _params.copyWith(name: value),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Cancelar',
            style: TextStyle(color: ColorScheme.of(context).secondary),
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(_params),
          child: const Text('Criar'),
        ),
      ],
    );
  }
}

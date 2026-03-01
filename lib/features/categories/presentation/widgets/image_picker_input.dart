import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerInput extends StatefulWidget {
  final ValueChanged<File?> onImageSelected;

  const ImagePickerInput({super.key, required this.onImageSelected});

  @override
  State<ImagePickerInput> createState() => _ImagePickerInputState();
}

class _ImagePickerInputState extends State<ImagePickerInput> {
  File? _image;
  final _picker = ImagePicker();

  Future<void> _showOptions() async {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: const Text('Selecionar da galeria'),
                onTap: () {
                  Navigator.pop(context);
                  _pick(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text('Tirar foto'),
                onTap: () {
                  Navigator.pop(context);
                  _pick(ImageSource.camera);
                },
              ),
              if (_image != null)
                ListTile(
                  leading: const Icon(Icons.delete_outline),
                  title: const Text('Remover imagem'),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() => _image = null);
                    widget.onImageSelected(null);
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pick(ImageSource source) async {
    final picked = await _picker.pickImage(source: source, imageQuality: 80);

    if (picked != null) {
      final file = File(picked.path);
      setState(() => _image = file);
      widget.onImageSelected(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final inputTheme = theme.inputDecorationTheme;
    final colorScheme = theme.colorScheme;
    final enabledBorder = inputTheme.enabledBorder as OutlineInputBorder?;

    return GestureDetector(
      onTap: _showOptions,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius:
              enabledBorder?.borderRadius ?? BorderRadius.circular(12),
          border: Border.fromBorderSide(
            enabledBorder?.borderSide ?? const BorderSide(),
          ),
          color: colorScheme.primary,
        ),
        child: _image == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.add_photo_alternate_outlined, size: 32),
                  SizedBox(height: 8),
                  Text('Adicionar imagem'),
                ],
              )
            : Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        enabledBorder?.borderRadius ??
                        BorderRadius.circular(12),
                    child: Image.file(
                      _image!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.black.withValues(alpha: 0.6),
                      child: const Icon(
                        Icons.edit,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

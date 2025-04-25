import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/provider/user_provider.dart';
import '/widget/image_input.dart';
// import '/widget/location_input.dart';

class AddPlace extends ConsumerStatefulWidget {
  const AddPlace({super.key});
  @override
  ConsumerState<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends ConsumerState<AddPlace> {
  final _titleController = TextEditingController();
  File? _selectImage;

  void _savePlaces() {
    final enteredTitle = _titleController.text;
    if (enteredTitle.isEmpty || _selectImage == null) {
      return;
    }
    ref.read(placeProvider.notifier).addPlace(enteredTitle, _selectImage!);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Places')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(label: Text('Title')),
              controller: _titleController,
              style: TextStyle(color: Theme.of(context).colorScheme.surface),
            ),
            const SizedBox(height: 12),
            ImageInput(onPickImage: (image) => _selectImage = image),
            const SizedBox(height: 12),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              onPressed: _savePlaces,
              label: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

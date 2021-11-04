import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  const TodoFormWidget({
    Key? key,
    this.title = '',
    this.description = '',
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onSavedTodo,
  }) : super(key: key);

  final String title;
  final String description;

  final ValueChanged<String>? onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitleWidget(),
            const SizedBox(height: 8),
            buildDescriptionWidget(),
            const SizedBox(height: 32),
            buildSaveButton(),
          ],
        ),
      );
  Widget buildTitleWidget() => TextFormField(
        initialValue: title,
        maxLines: 1,
        validator: (title) {
          if (title!.isEmpty) {
            return 'The title cannot be empty';
          } else {
            return null;
          }
        },
        onChanged: onChangedTitle,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Title',
        ),
      );
  Widget buildDescriptionWidget() => TextFormField(
        initialValue: description,
        maxLines: 2,
        validator: (description) {
          if (description!.isEmpty) {
            return 'The description cannot be empty';
          } else {
            return null;
          }
        },
        onChanged: onChangedDescription,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Description',
        ),
      );
  Widget buildSaveButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
          ),
          onPressed: onSavedTodo,
          child: const Text('SAVE'),
        ),
      );
}

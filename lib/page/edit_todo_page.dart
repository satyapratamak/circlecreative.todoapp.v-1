import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/misc/utils.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/page/home_page.dart';
import 'package:todoapp/provider/todos_provider.dart';
import 'package:todoapp/widget/todo_form_widget.dart';

class EditTodoPage extends StatefulWidget {
  final Todo? todo;

  const EditTodoPage({Key? key, required this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = widget.todo!.title;
    description = widget.todo!.description;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Edit Todo"),
          actions: [
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => deleteTodo(context, widget.todo),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: TodoFormWidget(
              title: title,
              description: description,
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onSavedTodo: () => saveTodo(context, widget.todo),
            ),
          ),
        ),
      );

  void saveTodo(BuildContext context, Todo? todo) {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);

      provider.updateTodo(todo, title, description);
      //Utils.showSnackbar(context, "Edited Task successfully");
      Navigator.of(context).pop();
    }
  }

  void deleteTodo(BuildContext context, Todo? todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Navigator.of(context).pop();
    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context) => const HomePage()),
    //     (Route<dynamic> route) => false);
    // Utils.showSnackbar(context, "Deleted Task successfully");
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:uipractice/app/locator.dart';
import 'package:uipractice/ui/todo/todo_viewmodel.dart';
class TodoView extends HookWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var todo = useTextEditingController();
    return ViewModelBuilder<TodoViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              model.addTodo(todo.text);
              todo.clear();
            },
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              TextField(
                controller: todo,
              ),
              if (model.todos.isNotEmpty)
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                    itemCount: model.todos.length,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.purple[100],
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      child: Text(model.todos[index]),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => getIt<TodoViewModel>(),
    );
  }
}

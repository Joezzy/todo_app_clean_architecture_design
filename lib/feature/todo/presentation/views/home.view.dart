

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clean_architecture/feature/todo/domain/entities/todo.dart';
import 'package:todo_clean_architecture/feature/todo/presentation/controller/todo.controller.dart';

class HomeView extends GetView<TodoController> {
   HomeView({Key? key}) : super(key: key);

  // final controller=Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(title:const Text("Todo"),),
      body: StreamBuilder(
        stream: controller.getTodo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final todos = snapshot.data!;
            if (todos.isEmpty) {
              return const Center(
                child: Text("No todos found"),
              );
            }
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos[index].text.toString()),
                  subtitle: Text(todos[index].description.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        splashRadius: 20,
                        onPressed: () {
                          controller.titleController.text = todos[index].text.toString();
                          controller.descriptionController.text = todos[index].description.toString();
                          showModalBottomSheet(
                            enableDrag: true,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return Container(
                                width: double.maxFinite,
                                height: MediaQuery.of(context).size.height * 0.8,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Form(
                                    key: controller.formKey,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: controller.titleController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Title is required';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            labelText: 'Title',
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 8.0),
                                          child: TextFormField(
                                            controller: controller.descriptionController,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Description is required';
                                              }
                                              return null;
                                            },
                                            decoration: const InputDecoration(
                                              labelText: 'Description',
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.maxFinite,
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              if (controller.formKey.currentState!.validate()) {
                                                controller.editTodo(todos[index].id);

                                                // pop the bottom sheet
                                                Navigator.pop(context);
                                              }
                                            },
                                            child: const Text('Edit Todo'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );



                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        splashRadius: 20,
                        onPressed: () {
                          controller.deleteTodo(todos[index]);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            enableDrag: true,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.8,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.titleController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Title is required';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Title',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            controller: controller.descriptionController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Description is required';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Description',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (controller.formKey.currentState!.validate()) {
                                controller.addTodo();
                                // pop the bottom sheet
                                Navigator.pop(context);
                              }
                            },
                            child: const Text('Add'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

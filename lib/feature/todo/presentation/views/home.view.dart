

import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(title:const Text("Todo"),),
      body: const Center(
        child: Text("Ni Nalz"),
      ),
      floatingActionButton: FloatingActionButton(
        child:const  Icon(Icons.add),
        onPressed: (){

        },
      ),
    );
  }
}

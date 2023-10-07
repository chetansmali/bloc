
import 'package:bloc_todo_json/bloc/todo_bloc.dart';
import 'package:bloc_todo_json/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(create: (context) => TodoBloc(),
      child: const MaterialApp(
        home: HopmePage(),
      ),
    )
  );
}


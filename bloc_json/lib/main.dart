import 'package:bloc_json/bloc/post_bloc.dart';
import 'package:bloc_json/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp(
    BlocProvider(
      create: (context) => PostBloc(),
      child: MaterialApp(
        home: MyHomePage(),
      ),
    ),
  );
}



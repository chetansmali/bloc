import 'package:bloc_todo_json/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HopmePage extends StatefulWidget {
  const HopmePage({super.key});

  @override
  State<HopmePage> createState() => _HopmePageState();
}

class _HopmePageState extends State<HopmePage> {
  @override
  Widget build(BuildContext context) {

  final todoBloc =BlocProvider.of<TodoBloc>(context);
  todoBloc.add(FetchTodoEvent());

    return Scaffold(
      appBar: AppBar(
        title: Text('TODO LIST'),
      ),
      body: BlocBuilder<TodoBloc,TodoState>(
        builder: (context,state){
          if(state is TodoLoading){
            return Center(child: CircularProgressIndicator(),);
          }else
            if(state is TodoLoaded){
              final d = state.todo;
              return ListView.builder(
                  itemCount: d.length,
                  itemBuilder:(contex, index){
                    final oned = d[index];
                    return  ListTile(
                      tileColor:  oned.completed ? Colors.green : Colors.red,
                      title: Text(oned.title),
                      leading: Text(oned.id.toString()),
                      subtitle: Text(oned.completed.toString()),
                    );
                  }
              );
            } else
            if(state is TodoError){
              return Center(child: Text(state.error),);
            }else{
              return Center(child: Text('Plese refresh it'),);
            }
        },
      ),
    );
  }
}

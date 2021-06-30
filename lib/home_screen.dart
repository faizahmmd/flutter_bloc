import 'package:bloc_sample/bloc.dart';
import 'package:bloc_sample/event.dart';
import 'package:bloc_sample/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final _myBloc = context.read<MyBloc>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          BlocBuilder<MyBloc, MyState>(builder: (context, state) {
            if (state is LoadingState) {
              return CircularProgressIndicator();
            } else if (state is FirstState) {
              return Text(state.name);
            } else if (state is SecondState) {
              return Text(state.name);
            } else if (state is ErrorState) {
              return Text("Error");
            }
            return const SliverFillRemaining(
              child: Text('Something went wrong!'),
            );
          }),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () async{
              _myBloc.add(FirstEvent());
              await Future.delayed(Duration.zero);
            },
            child: Container(
              color: Colors.greenAccent,
              width: 200,
              height: 50,
              child: Center(
                child: Text("Show First Name"),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () async{
              _myBloc.add(SecondEvent());
              await Future.delayed(Duration.zero);
            },
            child: Container(
              color: Colors.greenAccent,
              width: 200,
              height: 50,
              child: Center(
                child: Text("Show Last Name"),
              ),
            ),
          )
        ],
      )),
    );
  }
}

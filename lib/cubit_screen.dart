import 'package:bloc_sample/bloc.dart';
import 'package:bloc_sample/bloc_screen.dart';
import 'package:bloc_sample/cubit.dart';
import 'package:bloc_sample/event.dart';
import 'package:bloc_sample/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePageCubit extends StatefulWidget {
  @override
  _MyHomePageCubitState createState() => _MyHomePageCubitState();
}

class _MyHomePageCubitState extends State<MyHomePageCubit> {
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
              BlocBuilder<MyCubit, String>(builder: (context, state) {
                  return Text(state);
              }),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () async{
                  context.read<MyCubit>().getFirstName();
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
                  context.read<MyCubit>().getLastName();
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
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                       MaterialPageRoute(
                          builder: (BuildContext context) =>
                          MyHomePageBloc()));
                },
                child: Container(
                  color: Colors.greenAccent,
                  width: 200,
                  height: 50,
                  child: Center(
                    child: Text("Go to MyHomePageBloc"),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

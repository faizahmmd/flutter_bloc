import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class MyState extends Equatable {
  const MyState();
}

class LoadingState extends MyState {
  const LoadingState();

  @override
  List<Object?> get props => [];
}

class FirstState extends MyState {
  const FirstState({required this.name});
  final String name;

  @override
  List<Object?> get props => [];
}

class SecondState extends MyState {
  const SecondState({required this.name});
  final String name;

  @override
  List<Object?> get props => [name];
}

class ErrorState extends MyState {
  const ErrorState();

  @override
  List<Object?> get props => [];
}

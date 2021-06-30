import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class MyEvent extends Equatable {
  const MyEvent();
}

class FirstEvent extends MyEvent {
  const FirstEvent();

  @override
  List<Object?> get props => [];
}

class SecondEvent extends MyEvent {
  const SecondEvent();

  @override
  List<Object?> get props => [];
}

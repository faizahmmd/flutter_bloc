import 'package:bloc_sample/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCubit extends Cubit<String> {
  MyCubit() : super("loading");

  void getFirstName(){
    String firstName = Repository().getFirstName();
    emit(firstName);
  }
  void getLastName() {
    String lastName = Repository().getLastName();
    emit(lastName);
  }
}
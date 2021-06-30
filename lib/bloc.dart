import 'package:bloc/bloc.dart';
import 'package:bloc_sample/event.dart';
import 'package:bloc_sample/repository.dart';
import 'package:bloc_sample/state.dart';

class MyBloc extends Bloc<MyEvent, MyState> {
  MyBloc() : super(LoadingState());

  @override
  Stream<MyState> mapEventToState(MyEvent event) async* {
    if (event is FirstEvent) {
      yield* firstFunction();
    } else if (event is SecondEvent) {
      yield* secondFunction();
    }
  }

  Stream<MyState> firstFunction() async* {
    yield LoadingState();
    try {
      final String name = Repository().getFirstName();
      yield FirstState(name: name);
    } on Exception {
      yield ErrorState();
    } catch (_) {
      yield ErrorState();
    }
  }

  Stream<MyState> secondFunction() async* {
    yield LoadingState();
    try {
      final String name = Repository().getLastName();
      yield SecondState(name: name);
    } on Exception {
      yield ErrorState();
    } catch (_) {
      yield ErrorState();
    }
  }
}

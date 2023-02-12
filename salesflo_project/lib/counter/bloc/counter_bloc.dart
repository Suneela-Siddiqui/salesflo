  import 'package:flutter_bloc/flutter_bloc.dart';

//  class CounterBloc extends Bloc<CounterEvent, int>  {
//     CounterBloc() : super(0);  // constructor of bloc

//       Stream<int> mapEventToState(CounterEvent event) async* {}
//  }

// enum CounterEvent {
//   Increment,
//   Decrement,
//   Reset
// }

// replaced by

abstract class CounterEvent {}

class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}

class Reset extends CounterEvent {}

abstract class CounterState {}

class CounterValue extends CounterState {
   final int value;
   CounterValue(this.value);
}

//   Stream<int> mapEventToState(CounterEvent event) async* {
//    switch (event) {
//         case CounterEvent.Increment:
//           yield state + 1;
//           break;
//         case CounterEvent.Decrement:
//           yield state - 1;
//           break;
//         case CounterEvent.Reset:
//           yield state * 0 + 0;
//           break;
//       } 

// }

// replaced by

class CounterBloc extends Bloc<CounterEvent, int> {
 CounterBloc() : super(0) {
  on<Increment>(((event, emit) => emit(state + 1)));
  on<Decrement>(((event, emit) => emit(state - 1)));
  on<Reset>(((event, emit) => emit(state * 0 + 0)));
 }

 void _addToValue(int toAdd, Emitter<CounterState> emit) {
   if (state is CounterValue) {
     emit(CounterValue((state as CounterValue).value + toAdd));
   }
 }
}
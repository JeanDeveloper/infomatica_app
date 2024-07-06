import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {

  int currentIndex = 0;

  MainBloc() : super(MainInitial()) {
    on<MainEvent>((event, emit) {

      if( event is ChangeTabEvent){
        emit(ChangingIndex());
        currentIndex = event.currentIndex;
        emit(ChangedIndex(currentIndex: currentIndex));
      }

    });
  }
}

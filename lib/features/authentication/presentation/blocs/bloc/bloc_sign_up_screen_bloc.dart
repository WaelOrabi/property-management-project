import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_sign_up_screen_event.dart';
part 'bloc_sign_up_screen_state.dart';

class BlocSignUpScreenBloc extends Bloc<BlocSignUpScreenEvent, BlocSignUpScreenState> {
  BlocSignUpScreenBloc() : super(SignUpInitial()) {
    on<BlocSignUpScreenEvent>((event, emit) {
      if(event is SignUpEvent)
        {
          emit(SignUpLoading());

        }
    });
  }
}

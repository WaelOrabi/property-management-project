import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_management_frontend/features/account/domain/usecases/account.dart';

import '../../../domain/usecases/account_reply.dart';
import '../../../domain/usecases/account_request.dart';
import 'sign_in_events.dart';
import 'sign_in_states.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  AccountUseCase accountUseCase;
  SignInBloc({required this.accountUseCase}) : super(SignInNormalState()) {
    on<SignInSubmittedEvent>(_submitted);
    on<SignInTypingEvent>(_typing);
  }

  void _submitted(SignInSubmittedEvent event, Emitter<SignInState> emit) async {
    await for (final signInReply in accountUseCase
        .signIn(SignInRequest(event.username, event.password))) {
      if (signInReply.succesful) {
        emit(SignInSuccessfulState());
      } else {
        print("ERRRR");
        emit(SignInFailedState(signInReply.error));
        break;
      }
    }
  }

  FutureOr<void> _typing(SignInTypingEvent event, Emitter<SignInState> emit) {
    emit(SignInNormalState());
  }
}

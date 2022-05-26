import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {}

class SignInSuccessfulState extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInFailedState extends SignInState {
  final String error;
  SignInFailedState(this.error);

  @override
  List<Object?> get props => [];
}

class SignInPendingState extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInNormalState extends SignInState {
  @override
  List<Object?> get props => [];
}

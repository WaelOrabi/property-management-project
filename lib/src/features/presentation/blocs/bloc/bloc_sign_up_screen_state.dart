part of 'bloc_sign_up_screen_bloc.dart';

@immutable
abstract class BlocSignUpScreenState {}

class SignUpInitial extends BlocSignUpScreenState {}
class SignUpLoading extends BlocSignUpScreenState{}
class SignUpSuccess extends BlocSignUpScreenState{}
class SignUpFailed extends BlocSignUpScreenState{}


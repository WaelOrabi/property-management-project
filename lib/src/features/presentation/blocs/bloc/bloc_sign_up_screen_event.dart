part of 'bloc_sign_up_screen_bloc.dart';

@immutable
abstract class BlocSignUpScreenEvent {}
// ignore: must_be_immutable
class SignUpEvent extends BlocSignUpScreenEvent{
  String name;
  String email;
  String phone;
  String password;
  SignUpEvent(this.name,this.email,this.phone,this.password);
}
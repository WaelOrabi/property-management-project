import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

abstract class SignInEvent extends Equatable {}

class SignInSubmittedEvent extends SignInEvent {
  final String username;
  final String password;
  SignInSubmittedEvent(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}
class SignInTypingEvent extends SignInEvent {
  final String username;
  final String password;
  SignInTypingEvent(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}

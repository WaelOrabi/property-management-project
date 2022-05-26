import 'dart:async';

import 'package:property_management_frontend/features/account/domain/entities/change_password.dart';
import 'package:property_management_frontend/features/account/domain/repositories/account_repository.dart';
import 'package:property_management_frontend/features/account/domain/repositories/account_repository_request.dart'
    as repository_request;

import 'package:property_management_frontend/features/account/domain/usecases/account_reply.dart';

import '../../../../core/error/exceptions.dart';

import '../../../account/domain/usecases/account_request.dart';
import '../entities/sign_in.dart';
import '../entities/sign_up.dart';

class AccountUseCase {
  late SignIn _signIn;
  late SignUp _signUp;
  late ChangePassword _changePassword;
  late AccountRepository _accountRepository;
  AccountUseCase(AccountRepository accountRepository) {
    _accountRepository = accountRepository;
  }

  Stream<SignInReply> signIn(SignInRequest signInRequest) {
    _signIn = SignIn(signInRequest.username, signInRequest.password);
    if (!_signIn.validateInfo()) {
      return Stream.value(SignInReply('Non valid input.', false));
    }
    return _accountRepository
        .authenticate(repository_request.AuthenticationRequest(
            signInRequest.username, signInRequest.password))
        .map<SignInReply>(
      (event) {

        if (event.succesful) {
          _accountRepository
              .authorize(repository_request.AuthorizeRequest(event.token));
        }
        return SignInReply(event.error, event.succesful);
      },
    );
  }

  Stream<SignInReply> signInSameUser() {
    return StreamController<SignInReply>().stream;
  }

  Future<SignUpReply> signUp(SignUpRequest signUpRequest) async {
    return Future.delayed(Duration(seconds: 1));
  }

  Future<ChangePasswordReply> changePassword(
      ChangePasswordRequest changePasswordRequest) {
    return Future.delayed(Duration(seconds: 1));
  }

  Future<SignOutReply> signOut() {
    return Future.delayed(Duration(seconds: 1));
  }
}

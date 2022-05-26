

import '../entities/sign_in.dart';
import 'account_repository_reply.dart';
import 'account_repository_request.dart';

abstract class AccountRepository {
  Stream<AuthenticationReply> authenticate(AuthenticationRequest authenticationRequest);
  Stream<Reply> authorize(AuthorizeRequest authorizeRequest) ;
  Future<SignIn> getSignedInUserInfo();
  Future<SignUpReply> signUp(SignUpRequest signUpRequest);

  Future<ChangePasswordReply> changePassword(ChangePasswordRequest changePasswordRequest);
  Future<SignOutReply> signOut();
}

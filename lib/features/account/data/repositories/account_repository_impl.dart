import 'package:property_management_frontend/features/account/domain/entities/sign_in.dart';
import 'package:property_management_frontend/features/account/domain/repositories/account_repository.dart';
import 'package:property_management_frontend/features/account/domain/repositories/account_repository_request.dart';
import 'package:property_management_frontend/features/account/domain/repositories/account_repository_reply.dart';

import '../datasources/account_local_data_source.dart';
import '../datasources/account_remote_data_source.dart';

class AccountRepositoryImpl extends AccountRepository {
  AccountRemoteDataSource accountRemoteDataSource;
  AccountLocalDataSource accountLocalDataSource;
  AccountRepositoryImpl(
      this.accountRemoteDataSource, this.accountLocalDataSource);
  @override
  Stream<AuthenticationReply> authenticate(
      AuthenticationRequest authenticationRequest) {
    return accountRemoteDataSource.sendAuthenticationRequest(
        AuthenticationRemoteRequestModel('signIn',
            authenticationRequest.username, authenticationRequest.password));
  }

  @override
  Stream<AuthorizationReply> authorize(AuthorizeRequest authorizeRequest) {
    return accountRemoteDataSource.sendAuthorizationRequest(
        AuthorizationRemoteRequestModel('authorize', authorizeRequest.token));
  }

  @override
  Future<ChangePasswordReply> changePassword(
      ChangePasswordRequest changePasswordRequest) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<SignIn> getSignedInUserInfo() {
    // TODO: implement getSignedInUserInfo
    throw UnimplementedError();
  }

  @override
  Future<SignOutReply> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<SignUpReply> signUp(SignUpRequest signUpRequest) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}

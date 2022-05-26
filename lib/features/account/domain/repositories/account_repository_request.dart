
class Request {

}
class AuthenticationRequest extends Request {
  String username, password;
  AuthenticationRequest(this.username, this.password);
}
class AuthorizeRequest extends Request {
  String token;
  AuthorizeRequest(this.token);
}
class SignUpRequest extends Request {
  String username, password, firstName, lastName;
  SignUpRequest(this.username, this.password, this.firstName, this.lastName);
}

class ChangePasswordRequest extends Request {
  String oldPassword, newPassword;
  ChangePasswordRequest(this.oldPassword, this.newPassword);
}

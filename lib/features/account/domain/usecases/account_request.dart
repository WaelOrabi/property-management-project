

class Request {

}
class SignInRequest extends Request {
  String username, password;
  SignInRequest(this.username, this.password);
}
class SignUpRequest extends Request {
  String username, password, firstName, lastName;
  SignUpRequest(this.username, this.password, this.firstName, this.lastName);
}

class ChangePasswordRequest extends Request {
  String oldPassword, newPassword;
  ChangePasswordRequest(this.oldPassword, this.newPassword);
}

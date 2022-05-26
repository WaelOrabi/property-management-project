class SignIn {
  String username;
  String password;
  SignIn(this.username, this.password);
  bool validateInfo() {
    return username.isNotEmpty && password.isNotEmpty;
  }
  
}

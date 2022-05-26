
class Reply {
  String error;
  bool succesful;
  Reply(this.error, this.succesful);
}

class SignInReply extends Reply {
  SignInReply(error, successful) : super(error, successful);
}

class SignUpReply extends Reply {
  SignUpReply(error, successful) : super(error, successful);
}

class ChangePasswordReply extends Reply {
  ChangePasswordReply(error, successful) : super(error, successful);
}

class SignOutReply extends Reply {
  SignOutReply(error, successful) : super(error, successful);
}

class LoginResponseEntity {
  LoginResponseEntity({
    this.message,
    this.statusMsg,
    this.user,
    this.token,
  });

  String? message;
  LoginUserEntity? user;
  String? token;
  String? statusMsg;
}

class LoginUserEntity {
  LoginUserEntity({
    this.name,
    this.email,
  });

  String? name;
  String? email;
}

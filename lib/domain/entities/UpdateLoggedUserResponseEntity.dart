class UpdateLoggedUserResponseEntity {
  UpdateLoggedUserResponseEntity({
    this.message,
    this.user,
  });

  String? message;
  UpdateLoggedUserEntity? user;
}

class UpdateLoggedUserEntity {
  UpdateLoggedUserEntity({
    this.name,
    this.email,
    this.role,
  });

  String? name;
  String? email;
  String? role;
}

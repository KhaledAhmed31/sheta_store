class SignInParams {
 String email;
 String password;

  SignInParams({required this.email, required this.password});
  Map<String, dynamic> toJson() {
    return {"email": email, "password": password};
  }
}
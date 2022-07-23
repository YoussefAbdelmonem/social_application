abstract class RegisterScreenStates{}

class RegisterInitialState extends RegisterScreenStates{}

class RegisterLoadingState extends RegisterScreenStates{}


class ShopChangePasswordVisibilityStateRegister extends RegisterScreenStates{}

class RegisterUploadImageState extends RegisterScreenStates{}

class RegisterSuccessState extends RegisterScreenStates{}

class RegisterErrorState extends RegisterScreenStates{
  final String error;

  RegisterErrorState(this.error);
}
class CreateUserSuccessState extends RegisterScreenStates{}

class CreateUserErrorState extends RegisterScreenStates{
  final String error;

  CreateUserErrorState(this.error);
}


import '../../data/models/login_model.dart';
import '../../data/models/signup_model.dart';

abstract class SignupStates {}

class SignupInitialState extends SignupStates{}
class SignupLoadingState extends SignupStates{}
class SignupSuccessState extends SignupStates{
  SignUpModel? authModel;
  SignupSuccessState(this.authModel);
}
class SignupErrorState extends SignupStates{
  final String error;
  SignupErrorState(this.error);
}

abstract class LoginStates {}
class LoginInitialState extends LoginStates {}
class LoginLoadingState extends LoginStates {}
class LoginSuccessState extends LoginStates {
  final LoginModel loginModel;
  LoginSuccessState(this.loginModel);
}
class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}
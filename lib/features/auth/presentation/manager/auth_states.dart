
import '../../data/models/auth_model.dart';

abstract class SignupStates {}

class SignupInitialState extends SignupStates{}
class SignupLoadingState extends SignupStates{}
class SignupSuccessState extends SignupStates{
  AuthModel? authModel;
  SignupSuccessState(this.authModel);
}
class SignupErrorState extends SignupStates{
  final String error;
  SignupErrorState(this.error);
}

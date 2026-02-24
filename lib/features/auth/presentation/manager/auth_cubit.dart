import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_food_app/core/utilities/api_constants.dart';
import 'package:homemade_food_app/features/auth/data/repos/auth_repo.dart';
import 'package:homemade_food_app/features/auth/presentation/manager/auth_states.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/signup_model.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this.authRepo) : super(SignupInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  final AuthRepo authRepo;
  bool loginPasswordVisible = true;
  bool signupPasswordVisible  = true;
  bool confirmPasswordVisible  = true;
  void changeLoginPasswordVisibility() {
    loginPasswordVisible = !loginPasswordVisible;
    print(loginPasswordVisible);
    emit(changeLoginPasswordVisibilityState());
  }
  void changeSignupPasswordVisibility() {
    signupPasswordVisible = !signupPasswordVisible;
    print(signupPasswordVisible);
    emit(changeSignupPasswordVisibilityState());
  }
  void changeSignupConfirmPasswordVisibility() {
    confirmPasswordVisible = !confirmPasswordVisible;
    print(confirmPasswordVisible);
    emit(changeConfirmPasswordVisibilityState());
  }



  Future<void> SignupUser({
    required String? email,
    required String? password,
    required String? firstName,
    required String? lastName,
    required String? phone,
  }) async {
    emit(SignupLoadingState());
    Either<Failure, SignUpModel> result = await authRepo.SignupUser(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        phone: phone);
    result.fold((failure) {
      emit(SignupErrorState(failure.errorMessage));
    }, (signupModel) {
      emit(SignupSuccessState(signupModel));
    });
  }
  Future<void> LoginUser({
    required String email,
    required String password
})async{
    emit(LoginLoadingState());
    var result = await authRepo.LoginUser(email: email, password: password);
    result.fold((failure){
      emit(LoginErrorState(failure.errorMessage));
    }, (loginModel){
      ApiConstants.token = loginModel.token!;
      ApiConstants.id =loginModel.userData!.id!;
      emit(LoginSuccessState(loginModel));
    });
  }
}

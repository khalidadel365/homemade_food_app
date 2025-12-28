import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_food_app/features/auth/data/models/auth_model.dart';
import 'package:homemade_food_app/features/auth/presentation/manager/auth_states.dart';
import '../../../../core/utilities/api_service.dart';


class SignupCubit extends Cubit<SignupStates>{
  SignupCubit() :super(SignupInitialState());

  static SignupCubit get(context) => BlocProvider.of(context);


  AuthModel? signupModel;
  SignupUser({
    required String? email,
    required String? password,
    required String? firstName,
    required String? lastName,
    required String? phone,
  }){
     double? address1 = 1.556;
     double? address2 = 5.66;
     String? user_type = "consumer";
    emit(SignupLoadingState());
    ApiService.postData(
        endpoint: '/api/auth/signup/',
        data: {
          'first_name':firstName,
          'last_name':lastName,
          'email':email,
          'password':password,
          'phone_number':phone,
          'address_longitude':address1,
          'address_latitude':address2,
          'user_type':user_type,
        })?.then((value){
          print('iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii');
          print(value.statusCode);
            signupModel = AuthModel.fromJson(value.data);
            print(signupModel!.id);
            emit(SignupSuccessState(signupModel!));

    }).catchError((error){
      print(error.toString());
      emit(SignupErrorState(error.toString()));
    });
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homemade_food_app/core/widgets/custom_textformfield.dart';
import 'package:homemade_food_app/features/auth/presentation/manager/auth_states.dart';
import 'package:homemade_food_app/features/auth/presentation/views/widgets/sign_up_view_body.dart';

import '../../../../core/utilities/functions/show_snack_bar.dart';
import '../manager/signup_cubit.dart';
import 'login_view.dart';

class SignupView extends StatefulWidget {
  SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupStates>(
      listener: (context, state) {
        if (state is SignupLoadingState) {
          print('loading');
        }
        if (state is SignupSuccessState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginView()),
          );
        } else if (state is SignupErrorState) {
          showSnackBar(
              context: context,
              message: 'email may be already in use',
              color: Colors.red);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.orange[50],
          body: const SafeArea(
            child: SignUpViewBody(),
          ),
        );
      },
    );
  }
}

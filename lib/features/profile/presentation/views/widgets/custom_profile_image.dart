import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_food_app/core/utilities/api_constants.dart';
import 'package:homemade_food_app/core/utilities/image_helper.dart';
import '../../../../../constants.dart';
import '../../profile_cubit/profile_cubit.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({super.key, required this.profileImage});
  final String profileImage;
  // String fixUrl(String url) {
  //   return url.replaceAll(
  //       'http://10.0.2.2:8000',
  //       'https://unsegregated-itchingly-charisse.ngrok-free.dev'
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(70)),
          child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageUrl: profileImage)),
        ),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(70)),
          child: InkWell(
            onTap: () {
              ImageHelper.pickImageWithChoice(context).then((value) {
                print(value!.path);
                print(value);
                BlocProvider.of<ProfileCubit>(context).updateProfileImage(
                    imageProfile: value, token: ApiConstants.token!);
                print('success');
              });
            },
            child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColor,
                ),
                child: Icon(
                  color: Colors.white,
                  Icons.edit,
                  size: 17,
                )),
          ),
        ),
      ],
    );
  }
}

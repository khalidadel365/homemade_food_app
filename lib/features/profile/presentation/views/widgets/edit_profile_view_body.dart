import 'package:flutter/material.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            controller: firstNameController,
            decoration: const InputDecoration(labelText: 'First Name'),
          ),
          TextFormField(
            controller: lastNameController,
            decoration: const InputDecoration(labelText: 'Last Name'),
          ),
          TextFormField(
            controller: phoneController,
            decoration: const InputDecoration(labelText: 'Phone Number'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // هنا بنعمل الـ Map اللي فيها الداتا اللي اتغيرت بس (PATCH)
              Map<String, dynamic> updatedData = {
                "first_name": firstNameController.text,
                "last_name": lastNameController.text,
                "phone_number": phoneController.text,
              };

              // بننادي على الـ Cubit
              BlocProvider.of<ProfileCubit>(context).editProfile(
                token: 'YOUR_TOKEN', // هاته من الـ Cache أو الـ Constants
                id: 5, // الـ ID بتاعك
                updatedData: updatedData,
              );
            },
            child: const Text('Save Changes'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
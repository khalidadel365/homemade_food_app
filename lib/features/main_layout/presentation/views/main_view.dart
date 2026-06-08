import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/features/home/presentation/views/home_view.dart';
import '../../../../core/utilities/service_locator.dart';
import '../../../cart/presentation/manager/cubit/cart_cubit.dart';
import '../../../orders/presentation/views/orders_view.dart';
import '../../../profile/presentation/views/profile_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List<Widget> screens = [
    HomeView(),
    OrdersView(),
    ProfileView(),
  ];
  int current_index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<CartCubit>(),
      child: Scaffold(
        body: screens[current_index],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: current_index,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Colors.grey.shade600,
          backgroundColor: Colors.white,
          elevation: 10,
          onTap: (index) {
            setState(() {
              current_index = index;
            });
          },
        ),
      ),
    );
  }
}

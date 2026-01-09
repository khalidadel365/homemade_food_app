import 'package:flutter/material.dart';
import '../../../home/presentation/views/home_view.dart';
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
    return Scaffold(
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
        onTap: (index){
          setState(() {
            current_index = index;
          });
        },
      ),
    );
  }
}

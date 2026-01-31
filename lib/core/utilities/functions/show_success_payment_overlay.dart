import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homemade_food_app/core/utilities/app_router.dart';
import 'package:lottie/lottie.dart';

void showSuccessOverlay(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.black12,
    barrierDismissible: false,
    builder: (context) {
      Future.delayed(const Duration(milliseconds: 2400), () {
        Navigator.pop(context);
        GoRouter.of(context).go(AppRouter.kMainView);
      });
      return Center(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                'assets/SuccessPayment.json',
                width: 150,
                height: 150,
                repeat: false,
                renderCache: RenderCache.drawingCommands,
                frameRate: FrameRate(60)
              ),
              const SizedBox(height: 15),
              const Text(
                "Order Placed!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, decoration: TextDecoration.none, color: Colors.black),
              ),
            ],
          ),
        ),
      );
    },
  );
}
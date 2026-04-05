import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/all_dishes/presentation/manager/cubit/all_dishes_cubit.dart';
import '../../../features/all_dishes/presentation/manager/states/all_dishes_states.dart';
import '../../../features/all_dishes/presentation/views/widgets/availability_section.dart';
import '../../../features/all_dishes/presentation/views/widgets/filter_actions_buttons.dart';
import '../../../features/all_dishes/presentation/views/widgets/price_section.dart';
import '../styles.dart';

void showFilterBottomSheet(BuildContext context, FetchAllDishesCubit cubit) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return BlocProvider.value(
        value: cubit,
        child: BlocBuilder<FetchAllDishesCubit, FetchAllDishesState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
                padding: const EdgeInsets.only(right: 20, top: 20, left: 20, bottom: 50),
                height: MediaQuery.of(context).size.height * 0.55,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(width: 50, height: 5, decoration: BoxDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        Text("Filters", style: Styles.textStyle18),
                        const Spacer(),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.close, color: Colors.grey.shade500),
                        )
                      ],
                    ),
                    const Text("Price Range", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 14),

                    PriceSection(
                      minPriceController: cubit.minPriceController,
                      maxPriceController: cubit.maxPriceController,
                    ),

                    const SizedBox(height: 14),
                    const Text("Availability", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                    AvailabilitySection(
                      isAvailable: cubit.isAvailable,
                      onChanged: (value) => cubit.changeAvailability(value),
                    ),

                    const Spacer(),

                    FilterActionsButtons(
                      onReset: () => cubit.resetFilters(),
                      onApply: () {
                        cubit.fetchAllDishes();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

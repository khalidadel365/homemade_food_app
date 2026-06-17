import 'package:flutter/material.dart';

class AddressInfoWidget extends StatelessWidget {
  final String address;
  const AddressInfoWidget({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined, color: Colors.orange),
          const SizedBox(width: 12),
          Expanded(
            child: Text(address, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
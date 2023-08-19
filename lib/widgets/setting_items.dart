import 'package:flutter/material.dart';

Widget buildSettingOption(IconData icon, String title) {
  return GestureDetector(
    onTap: () {
      // Handle option click here
    },
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Icon(
            icon,
            size: 28,
            color: Colors.black,
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}
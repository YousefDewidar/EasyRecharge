import 'package:flutter/material.dart';

class MobileType extends StatelessWidget {
  final Color color;
  final String name;
  final String type;
  final String image;
  final bool hasChecked;

  const MobileType({
    super.key,
    required this.color,
    required this.name,
    required this.type,
    required this.image,
    this.hasChecked = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
          color: hasChecked ? color : color.withOpacity(.6),
          border: hasChecked
              ? Border.all(color: Colors.white, width: 2)
              : const Border()),
      height: 160,
      width: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, width: 100, height: 80),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

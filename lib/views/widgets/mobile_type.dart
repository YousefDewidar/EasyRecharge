import 'package:easy_recharge/cubits/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileType extends StatefulWidget {
  final Color color;
  final String name;
  final String type;
  final String image;

  const MobileType({
    super.key,
    required this.color,
    required this.name,
    required this.type,
    required this.image,
  });

  @override
  State<MobileType> createState() => _MobileTypeState();
}

class _MobileTypeState extends State<MobileType> {
  bool hasChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (hasChecked) {
          context.read<HomeCubit>().methodType = null;
        } else {
          context.read<HomeCubit>().methodType = widget.type;
        }
        hasChecked = !hasChecked;
        setState(() {});
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
            color: hasChecked ? widget.color : widget.color.withOpacity(.6),
            border: hasChecked
                ? Border.all(color: Colors.white, width: 2)
                : const Border()),
        height: 160,
        width: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(widget.image, width: 100, height: 80),
            const SizedBox(height: 10),
            Text(
              widget.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

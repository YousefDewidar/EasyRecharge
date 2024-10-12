import 'package:easy_recharge/cubits/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileType extends StatefulWidget {
  final Color color;
  final String name;
  final String type;

  const MobileType({
    super.key,
    required this.color,
    required this.name,
    required this.type,
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
      child: Container(
        decoration: BoxDecoration(
            color: widget.color,
            border: hasChecked
                ? Border.all(color: Colors.white, width: 2)
                : const Border()),
        height: 80,
        width: 85,
        child: Center(
          child: Text(
            widget.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: use_build_context_synchronously

import 'package:easy_recharge/cubits/home_cubit.dart';
import 'package:easy_recharge/generated/l10n.dart';
import 'package:easy_recharge/views/widgets/mobile_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TypesGridView extends StatefulWidget {
  const TypesGridView({
    super.key,
  });

  @override
  State<TypesGridView> createState() => _TypesGridViewState();
}

class _TypesGridViewState extends State<TypesGridView> {
  List<MobileType> types() => [
        MobileType(
          color: const Color.fromARGB(255, 244, 119, 37),
          name: S.of(context).vodafone,
          type: "فودافون",
          image: 'assets/pngegg.png',
        ),
        MobileType(
          color: Colors.green,
          name: S.of(context).etisalat,
          type: "اتصالات",
          image: 'assets/eti.png',
        ),
        MobileType(
          color: Colors.orange,
          name: S.of(context).orange,
          type: "اورانج",
          image: 'assets/orange-logo-116093713624dxieyabws.png',
        ),
        MobileType(
          color: Colors.deepPurple,
          name: S.of(context).we,
          type: "وي",
          image: 'assets/المصرية للاتصالات.png',
        ),
      ];

  int selectedInd = -1;

  @override
  void initState() {
    getSelectedIng();
    super.initState();
  }

  void getSelectedIng() async {
    var pref = await SharedPreferences.getInstance();
    selectedInd = pref.getInt('selectedInd') ?? -1;
    if (selectedInd != -1) {
      context.read<HomeCubit>().methodType = types()[selectedInd].type;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
          itemCount: 4,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                var pref = await SharedPreferences.getInstance();
                if (selectedInd == index) {
                  context.read<HomeCubit>().methodType = null;
                  selectedInd = -1;
                  pref.setInt('selectedInd', selectedInd);
                } else {
                  context.read<HomeCubit>().methodType = types()[index].type;
                  selectedInd = index;
                  pref.setInt('selectedInd', selectedInd);
                }
                setState(() {});
              },
              child: MobileType(
                hasChecked: selectedInd == index,
                color: types()[index].color,
                name: types()[index].name,
                type: types()[index].type,
                image: types()[index].image,
              ),
            );
          },
        ),
      ),
    );
  }
}

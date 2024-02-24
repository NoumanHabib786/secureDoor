import 'package:flutter/material.dart';
import 'package:secure_fitness_comp/resources/appColors.dart';

class EnthuDrawer extends StatefulWidget {
  const EnthuDrawer({Key? key}) : super(key: key);

  @override
  State<EnthuDrawer> createState() => _EnthuDrawerState();
}

class _EnthuDrawerState extends State<EnthuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainColor,
    );
  }
}

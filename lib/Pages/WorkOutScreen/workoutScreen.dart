import 'package:flutter/material.dart';

import '../../Utils/AppFonts.dart';

class WorkoutScreen extends StatelessWidget {
  WorkoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Scaffold(
      body: Center(
        child: Text('Workout Screen',style: AppFonts.fontBoldLarge,),
      ),
    );
  }
}

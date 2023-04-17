import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:voting_app/constants/color_list.dart';

class AppLoader extends StatelessWidget {
  final double width;
  final double height;
  const AppLoader({Key? key, this.width = 60, this.height = 60})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitThreeBounce(
        color: ColorList.primaryColor,
        size: height,
      ),
    );
  }
}

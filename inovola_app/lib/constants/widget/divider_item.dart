import 'package:flutter/material.dart';
import 'package:inovola_app/constants/appColors.dart';

class DividerItem extends StatelessWidget {
  const DividerItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Divider(
      color: MyColors.lightGreyColor,
      thickness: 1,
    );
  }
}

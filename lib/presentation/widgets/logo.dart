import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restobuy_restaurant_flutter/presentation/blocs/theme/theme_cubit.dart';
import 'package:restobuy_restaurant_flutter/presentation/themes/theme_color.dart';

import '../../common/extensions/size_extensions.dart';

class Logo extends StatelessWidget {
  final double height;

  const Logo({
    Key? key,
    required this.height,
  })   : assert(height > 0, 'height should be greater than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo_vertical.png',
      height: height.w,
      width: height.w,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/cubit/banner/banner_cubit.dart';
import 'custom_image_picker.dart';

class HeaderField extends StatelessWidget {
  const HeaderField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerCubit, BannerState>(builder: (context, state) {
      return Center(
        child: buildCustomImagePicker(
          state: state,
          title: 'Image',
          image: context.read<BannerCubit>().state.banner?.imageUrl ?? '',
        ),
      );
    });
  }
}

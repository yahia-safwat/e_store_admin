import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/cubit/category/category_cubit.dart';
import 'custom_image_picker.dart';

class HeaderField extends StatelessWidget {
  const HeaderField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildCustomImagePicker(
            state: state,
            title: 'Image',
            image: context.read<CategoryCubit>().state.category?.imageUrl ?? '',
          ),
          buildCustomImagePicker(
            state: state,
            title: 'Icon',
            image: context.read<CategoryCubit>().state.category?.iconUrl ?? '',
          ),
        ],
      );
    });
  }
}

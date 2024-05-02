import 'package:e_store_app1_admin/core/components/snackbar/custom_snackbar.dart';
import 'package:e_store_app1_admin/logic/cubit/category/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../config/size_config.dart';
import '../../../../data/services/firebase_services/storage_service.dart';
import '../../../../logic/cubit/cubits.dart';
import '../../../widgets/section_title.dart';

Widget buildCustomImagePicker(
    {required CategoryState state,
    required String image,
    required String title}) {
  return CustomImagePicker(
    state: state,
    image: image,
    title: title,
  );
}

class CustomImagePicker extends StatelessWidget {
  final CategoryState state;
  final String image;
  final String title;
  CustomImagePicker({
    Key? key,
    required this.state,
    required this.image,
    required this.title,
  }) : super(key: key);

  final StorageService storage = StorageService();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: getProportionateScreenWidth(70),
          child: SectionTitle(title: '$title:', showSeeMore: false),
        ),
        SizedBox(height: getProportionateScreenHeight(10)),
        Card(
          child: Image.network(
            image == '' ? context.read<ProductCubit>().noImage : image,
            height: 70,
            width: 70,
            fit: BoxFit.cover,
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
            fixedSize: MaterialStateProperty.all(Size(70, 20)),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
          ),
          onPressed: () async {
            if ('Category Icon' == 'Category $title') {
              if (context.read<CategoryCubit>().state.category?.imageUrl ==
                  '') {
                showCustomSnackbar(
                  context: context,
                  message: 'Plaese Select Category Image First!',
                );
                return;
              }
            }

            ImagePicker _picker = ImagePicker();
            final _image = await _picker.pickImage(source: ImageSource.gallery);

            if (_image == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('No image was selected.'),
                ),
              );
            }

            if (_image != null) {
              await storage.uploadImage(
                image: _image,
                folderName: 'categories',
                uid: context.read<CategoryCubit>().state.category!.uid,
              );
              var imageUrl = await storage.getDownloadURL(
                imageName: _image.name,
                folderName: 'categories',
                uid: context.read<CategoryCubit>().state.category!.uid,
              );

              if ('Category Image' == 'Category $title') {
                context.read<CategoryCubit>().categoryChanged(
                      state.category!.copyWith(imageUrl: imageUrl),
                    );
                context.read<CategoryCubit>().imageUrl = imageUrl ?? '';
              } else {
                context.read<CategoryCubit>().categoryChanged(
                      state.category!.copyWith(iconUrl: imageUrl),
                    );
                context.read<CategoryCubit>().iconUrl = imageUrl ?? '';
              }
            }
          },
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}

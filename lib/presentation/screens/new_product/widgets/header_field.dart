import 'package:e_store_app1_admin/core/components/snackbar/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/services/firebase_services/storage_service.dart';
import '../../../../logic/cubit/cubits.dart';

class HeaderField extends StatelessWidget {
  const HeaderField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomImagePicker(index: 0),
          CustomImagePicker(index: 1),
          CustomImagePicker(index: 2),
          CustomImagePicker(index: 3),
        ],
      );
    });
  }
}

class CustomImagePicker extends StatelessWidget {
  final int index;
  CustomImagePicker({
    Key? key,
    required this.index,
  }) : super(key: key);

  final StorageService storage = StorageService();

  @override
  Widget build(BuildContext context) {
    final pickedImages = context.read<ProductCubit>().pickedImages;
    return Column(
      children: [
        Card(
          child: Image.network(
            pickedImages[index] == ''
                ? context.read<ProductCubit>().noImage
                : pickedImages[index],
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
            if (context.read<ProductCubit>().category != '') {
              ImagePicker _picker = ImagePicker();
              //                 // final XFile? _image =
              final _image =
                  await _picker.pickImage(source: ImageSource.gallery);

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
                  folderName: 'products',
                  category: context.read<ProductCubit>().category,
                  uid: context.read<ProductCubit>().state.product!.uid,
                );
                var imageUrl = await storage.getDownloadURL(
                  imageName: _image.name,
                  folderName: 'products',
                  category: context.read<ProductCubit>().category,
                  uid: context.read<ProductCubit>().state.product!.uid,
                );

                context.read<ProductCubit>().updateImages(
                      index: index,
                      imageUrl: imageUrl,
                    );
              }
            } else {
              showCustomSnackbar(
                  context: context, message: 'No category was selected.');
            }
          },
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}

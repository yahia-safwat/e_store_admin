import 'package:e_store_app1_admin/core/components/snackbar/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../config/size_config.dart';
import '../../../../data/services/firebase_services/storage_service.dart';
import '../../../../logic/cubit/cubits.dart';
import '../../../widgets/section_title.dart';

Widget buildCustomImagePicker(
    {required BannerState state,
    required String image,
    required String title}) {
  return CustomImagePicker(
    state: state,
    image: image,
    title: title,
  );
}

class CustomImagePicker extends StatelessWidget {
  final BannerState state;
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
        SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: getProportionateScreenWidth(242),
              height: getProportionateScreenWidth(100),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF343434).withOpacity(0.4),
                    Color(0xFF343434).withOpacity(0.15),
                  ],
                ),
              ),
              child: Image.network(
                image == '' ? context.read<BannerCubit>().noBannerImage : image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
            fixedSize: MaterialStateProperty.all(Size(70, 20)),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
          ),
          onPressed: () async {
            if ('Banner Icon' == 'Banner $title') {
              if (context.read<BannerCubit>().state.banner?.imageUrl == '') {
                showCustomSnackbar(
                  context: context,
                  message: 'Plaese Select Banner Image First!',
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
                folderName: 'banners',
                uid: context.read<BannerCubit>().state.banner!.uid,
              );
              var imageUrl = await storage.getDownloadURL(
                imageName: _image.name,
                folderName: 'banners',
                uid: context.read<BannerCubit>().state.banner!.uid,
              );

              context.read<BannerCubit>().bannerChanged(
                    state.banner!.copyWith(imageUrl: imageUrl),
                  );
              context.read<BannerCubit>().imageUrl = imageUrl ?? '';
            }
          },
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}

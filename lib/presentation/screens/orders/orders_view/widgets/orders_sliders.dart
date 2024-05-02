// ignore_for_file: unused_import

import 'package:animate_do/animate_do.dart';
import 'package:e_store_app1_admin/config/size_config.dart';
import 'package:e_store_app1_admin/core/components/progress_indicator/progress_indicator.dart';
import 'package:e_store_app1_admin/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../logic/bloc/blocs.dart';
import '../../../../widgets/section_title.dart';
import '../../common/helpers.dart';
import 'explore_item.dart';

class OrdersSliders extends StatelessWidget {
  const OrdersSliders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            itemCount: sections.length,
            itemBuilder: (context, index) {
              return ExploreItem(
                title: sections[index],
              );
            },
          ),
        ),
        SizedBox(),
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/size_config.dart';
import '../../../../core/components/progress_indicator/progress_indicator.dart';
import '../../../../data/models/category_model.dart';
import '../../../../logic/bloc/category/category_bloc.dart';
import '../../../../logic/cubit/category/category_cubit.dart' as cubit;
import '../../../widgets/section_title.dart';
import 'category_tile.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(16),
              vertical: getProportionateScreenHeight(0),
            ),
            child: SectionTitle(
              title: "Settings",
              press: () {},
              showSeeMore: false,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(4),
              vertical: getProportionateScreenHeight(0),
            ),
            child: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
              if (state is CategoryLoading) {
                return buildProgressIndicator();
              }
              if (state is CategoryLoaded) {
                final List<Category> categories = state.categories;
                return ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      category: categories[index],
                      press: () {
                        context
                            .read<cubit.CategoryCubit>()
                            .setValues(category: categories[index]);
                      },
                    );
                  },
                );
              } else {
                return Text('Something Went Wrong!');
              }
            }),
          ),
        ],
      ),
    );
  }
}

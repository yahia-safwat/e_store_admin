import 'package:e_store_app1_admin/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/size_config.dart';
import '../../../../core/components/progress_indicator/progress_indicator.dart';
import '../../../../data/models/category_model.dart';
import '../../../../logic/bloc/category/category_bloc.dart';
import '../../../../logic/cubit/category/category_cubit.dart' as cubit;
import '../../../widgets/section_title.dart';
import 'category_card.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(16),
            vertical: getProportionateScreenHeight(0),
          ),
          child: SectionTitle(
            title: "Categories",
            press: () {},
            showSeeMore: false,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(10),
            vertical: getProportionateScreenHeight(10),
          ),
          child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
            if (state is CategoryLoading) {
              return buildProgressIndicator();
            }
            if (state is CategoryLoaded) {
              final List<Category> categories = state.categories;
              return Container(
                height: getProportionateScreenHeight(90),
                width: double.infinity,
                alignment: Alignment.center,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      category: categories[index],
                      icon: categories[index].iconUrl,
                      text: categories[index].name,
                      press: () {
                        context
                            .read<cubit.CategoryCubit>()
                            .setValues(category: categories[index]);

                        Navigator.pushNamed(
                          context,
                          NewCategoryScreen.routeName,
                          arguments: {'action': 'Edit'},
                        );
                      },
                    );
                  },
                ),
              );
            } else {
              return Text('Something Went Wrong!');
            }
          }),
        ),
      ],
    );
  }
}

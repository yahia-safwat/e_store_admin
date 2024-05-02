import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/size_config.dart';
import '../../../../core/components/progress_indicator/progress_indicator.dart';
import '../../../../data/models/category_model.dart';
import '../../../../logic/bloc/category/category_bloc.dart';
import '../screens/catalog/catalog_screen.dart';
import '../screens/products/widgets/category_card.dart';
import 'section_title.dart';

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
                      icon: categories[index].iconUrl,
                      text: categories[index].name,
                      press: () {
                        Navigator.of(context).pushNamed(CatalogScreen.routeName,
                            arguments: categories[index]);
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

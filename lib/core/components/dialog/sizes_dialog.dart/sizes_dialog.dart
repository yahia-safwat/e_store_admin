import 'package:e_store_app1_admin/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/cubit/cubits.dart';

List<String> sizes = List.generate(60, (index) => '${60 - index}');

Future<bool> showSizesDialg(context) async {
  bool? exitApp = await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pick Sizes'),
          SizedBox(height: getProportionateScreenHeight(10)),
          SizesRow(),
        ],
      ),
      content: Container(
        height: getProportionateScreenHeight(300),
        child:
            BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
          final _productCubit = context.read<ProductCubit>();
          return ListView.builder(
            itemCount: sizes.length,
            itemBuilder: ((context, index) {
              return SizeItem(
                title: sizes[index],
                value: _productCubit.pickedSizes.contains(sizes[index]),
                onChanged: (value) {
                  _productCubit.updateSizes(size: sizes[index]);
                },
              );
            }),
          );
        }),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text('Done'),
        ),
      ],
    ),
  );

  return exitApp ?? false;
}

class SizeItem extends StatelessWidget {
  final String title;
  final bool? value;
  final void Function(bool?)? onChanged;

  const SizeItem({
    Key? key,
    required this.title,
    this.value = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }
}

class SizesRow extends StatelessWidget {
  const SizesRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(300),
      height: 40,
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: context.read<ProductCubit>().pickedSizes.length,
            itemBuilder: ((context, index) {
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(2),
                ),
                width: getProportionateScreenWidth(34),
                height: getProportionateScreenHeight(34),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 0.5,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 10,
                        color: Colors.black12,
                      )
                    ]),
                child: Center(
                  child: Text(
                    context.read<ProductCubit>().pickedSizes[index],
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(12),
                        color: Colors.black),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

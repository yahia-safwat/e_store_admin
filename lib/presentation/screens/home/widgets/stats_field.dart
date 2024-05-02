import 'package:flutter/material.dart';

import '../../stats/stats_screen.dart';
import 'home_card.dart';

class StatsField extends StatelessWidget {
  const StatsField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeCard(
      title: 'Stats',
      onTap: () {
        Navigator.of(context).pushNamed(StatsScreen.routeName);
      },
    );
  }
}


// import 'package:flutter/material.dart';

// import '../../../../data/models/order_stats_model.dart';
// import 'custom_bar_chart.dart';

// class ChartField extends StatelessWidget {
//   const ChartField({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: FutureBuilder(
//         // future: orderStatsController.stats.value,
//         builder: (context, AsyncSnapshot<List<OrderStats>> snapshot) {
//           if (snapshot.hasData) {
//             return Container(
//               height: 250,
//               padding: const EdgeInsets.all(10),
//               child: CustomBarChart(
//                 orderStats: snapshot.data!,
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Text("${snapshot.error}");
//           }
//           return const Center(
//             child: CircularProgressIndicator(
//               color: Colors.black,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

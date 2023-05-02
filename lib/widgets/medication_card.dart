import 'package:flutter/material.dart';

import '../screens/order_details_screen.dart';
import '../models/medication_models.dart';

class MedicationCard extends StatelessWidget {
  final MedicationDate mD;
  final MedicationDates mDs;

  const MedicationCard({
    Key? key,
    required this.mD,
    required this.mDs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        //Provider.of<FavPro>(context, listen: false).updateId(movie.id);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => OrderDetailsScreen(order: MedicationDates())));
      },
      child: Container(
        width: size.width,
        height: size.height * 0.2,
        margin: const EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 5),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    // title
                    Text('order.title', softWrap: true),
                    // price + fees
                    Text('${'order.price + order.fees'} point'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    // time
                    Text('order.time'),
                    // date
                    Text('order.date', softWrap: true),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // time
                    Row(
                      children: const [
                        Icon(Icons.location_on_sharp),
                        Text('order.location', softWrap: true),
                      ],
                    ),
                    // date
                    const Text('${'order.distance'} km'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ));
  }
}

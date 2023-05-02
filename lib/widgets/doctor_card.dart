import 'package:flutter/material.dart';

import '../screens/doctor_details_screen.dart';
import '../models/doctor_models.dart';

class DoctorCard extends StatelessWidget {
  final DoctorDate dD;
  final DoctorDates dDs;

  const DoctorCard({Key? key, required this.dD, required this.dDs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        //Provider.of<FavPro>(context, listen: false).updateId(movie.id);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DoctorDsDetails(doctor: dDs,))
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: SizedBox(
              height: size.height * 0.3,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Hero(
                      tag: 'ad.adsId',
                      child: Image.network(
                        'ad.imageUrl',
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: Container(
                      width: size.width * 0.3,
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black54,),
                      child: const Text(
                        'ad.title',
                        style: TextStyle(color: Colors.white,),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),

          Expanded(
            flex: 7,
              child: Container(
                height: size.height * 0.25,
                decoration: const BoxDecoration(
                    color: Color(0xff416d6d),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15)
                    )
                ),
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
                          Text('ad.storeName', softWrap: true, overflow: TextOverflow.fade),
                          // price + fees
                          Text('${'ad.price'} point'),
                        ],
                      ),
                      const Text('ad.desc', softWrap: true, overflow: TextOverflow.fade,maxLines: 2),
                      Row(
                        children: const [
                          Icon(Icons.location_on_sharp),
                          Text('ad.location', softWrap: true, overflow: TextOverflow.fade,),
                        ],
                      ),
                      const Text('ad.startDate', overflow: TextOverflow.fade),
                    ],
                  ),
                ),
              )
          ),
        ],
      )
    );
  }
}

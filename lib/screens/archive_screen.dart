import 'package:flutter/material.dart';

import '../models/medication_models.dart';
import '../widgets/medication_card.dart';

import '../models/doctor_models.dart';
import '../widgets/doctor_card.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) => 0 == 0? MedicationCard(
        mD: MedicationDate(),
        mDs: MedicationDates(),
      )
          : DoctorCard(
        dD: DoctorDate(),
        dDs: DoctorDates(),
      ),
      itemCount: 10,
    );
  }
}

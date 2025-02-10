import 'package:flutter/material.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/enums/selector_type.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/widgets/selectors/selector.dart';

class MonthSelect extends StatelessWidget {
  const MonthSelect({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Selector(
          type: SelectorType.monthYear,
          date: date,
        ),
      ],
    );
  }
}

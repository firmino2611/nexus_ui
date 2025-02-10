import 'package:flutter/material.dart';
import 'package:nexus_ui/constants/numbers_constants_global.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/widgets/days/background_widget.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/widgets/days/day_container.dart';

/// Esta classe foi criada para unificar a lógica de apresentação do container
/// de dia e as variações de background.
class DayContainerWidget extends StatelessWidget {
  const DayContainerWidget({
    super.key,
    required this.dayContainer,
    this.backgroundWidget,
  });

  final DayContainer dayContainer;
  final BackgroundWidget? backgroundWidget;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: NumbersConstantsGlobal.one,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          backgroundWidget != null
              ? backgroundWidget!
              : const SizedBox.shrink(),
          dayContainer,
        ],
      ),
    );
  }
}

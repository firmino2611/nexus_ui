import 'package:flutter/material.dart';
import 'package:nexus_ui/themes/nexus_sizes.dart';

/// Classe responsável por processar qual a cor de fundo do container do dia.
/// O background consisite em dois containers de mesmo tamanho que é ajustado
/// em color e shape de acordo com a necessidade prevista.
/// As bordas de cada container podem ser arredondadas ou não, novamente de
/// acordo com a necessidade.
class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
    required this.colorStart,
    required this.colorEnd,
    this.leftBorderCircle = false,
    this.rightBorderCircle = false,
  });

  final Color colorStart;
  final Color colorEnd;
  final bool leftBorderCircle;
  final bool rightBorderCircle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: NexusSizes.s40,
            decoration: BoxDecoration(
              color: colorStart,
              borderRadius: leftBorderCircle
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(NexusSizes.s40),
                      bottomLeft: Radius.circular(NexusSizes.s40),
                    )
                  : null,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: NexusSizes.s40,
            decoration: BoxDecoration(
              color: colorEnd,
              borderRadius: rightBorderCircle
                  ? const BorderRadius.only(
                      topRight: Radius.circular(NexusSizes.s40),
                      bottomRight: Radius.circular(NexusSizes.s40),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}

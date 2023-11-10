import 'package:flutter/material.dart';
import 'package:my_market/core/widgets/shared/app_secondary_button.dart';

class CalculatorWidget extends StatelessWidget {
  const CalculatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 7,
        // childAspectRatio: 2.8,
        mainAxisExtent: 35,
      ),
      itemCount: calculatorButtons.length,
      itemBuilder: (context, index) {
        return AppSecondaryButton(
          text: calculatorButtons[index],
          onPressed: () {
            print(calculatorButtons[index]);
          },
        );
      },
    );
  }
}

final List<String> calculatorButtons = [
  '0',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  ',',
  'C',
];

import 'package:flutter/material.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/widgets/shared/app_secondary_button.dart';

class CountSelector extends StatelessWidget {
  const CountSelector({
    super.key,
    required this.onSelect,
  });
  final ValueChanged<int> onSelect;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      crossAxisCount: 5,
      childAspectRatio: 2,
      mainAxisSpacing: Sizes.p16,
      crossAxisSpacing: Sizes.p16,
      children: List.generate(
          10,
          (index) => AppSecondaryButton(
                text: '$index',
                textStyle: TextStyle(
                  fontSize: 24,
                  color: context.appColors.onBackground,
                ),
                onPressed: () {
                  onSelect(index);
                },
              )),
    );
  }
}

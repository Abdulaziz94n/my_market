import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/widgets/reusables/app_divider.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';

RoundedRectangleBorder get buttonShape => RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
    );

class PaymentDialog extends HookConsumerWidget {
  const PaymentDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTPE = useState(false);
    return ClipRRect(
      borderRadius: Sizes.defaultBorderRadius,
      child: ColoredBox(
        color: context.appColors.primary,
        child: SizedBox(
          height: 500,
          width: 600,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _DialogHeaders(
                buttonShape: buttonShape,
                isTPE: isTPE.value,
                onChanged: (value) => isTPE.value = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DialogHeaders extends StatelessWidget {
  const _DialogHeaders({
    required this.buttonShape,
    required this.onChanged,
    required this.isTPE,
  });

  final RoundedRectangleBorder buttonShape;
  final ValueChanged<bool> onChanged;
  final bool isTPE;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final activeColor = colors.background;
    final inActiveColor = colors.primary;
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: isTPE ? inActiveColor : activeColor,
                  shape: buttonShape,
                ),
                onPressed: () => onChanged(false),
                child: const AppText(text: 'ESPECES'),
              ),
              if (isTPE)
                AppDivider(
                  color: colors.background,
                  endIndent: 5,
                  indent: 10,
                )
            ],
          ),
        ),
        const HorizontalSpacingWidget(Sizes.p4),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: !isTPE ? inActiveColor : activeColor,
                  shape: buttonShape,
                ),
                onPressed: () => onChanged(true),
                child: const AppText(text: 'TPE'),
              ),
              if (!isTPE)
                AppDivider(
                  color: colors.background,
                  endIndent: 10,
                  indent: 5,
                )
            ],
          ),
        ),
      ],
    );
  }
}

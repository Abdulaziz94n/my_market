import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/widgets/reusables/app_divider.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';
import 'package:my_market/features/cashier/presentation/widgets/calculator_widget.dart';

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
      child: SizedBox(
        width: 500,
        height: 275,
        child: ColoredBox(
          color: context.appColors.primary,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _DialogHeaders(
                buttonShape: buttonShape,
                isTPE: isTPE.value,
                onChanged: (value) => isTPE.value = value,
              ),
              Expanded(child: _DialogBody(isTPE: isTPE.value)),
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

class _TPEBody extends StatelessWidget {
  const _TPEBody();

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Column(
      children: [
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AppText(text: 'Total:    144.50 DH'),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      AppText(text: 'Pris:'),
                      Spacer(),
                      AppText(text: '200.00 DH')
                    ],
                  ),
                  Row(
                    children: [
                      AppText(text: 'Difference:'),
                      Spacer(),
                      AppText(text: '55.50 DH')
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        const VerticalSpacingWidget(Sizes.p12),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 2,
                child: CalculatorWidget(),
              ),
              const HorizontalSpacingWidget(Sizes.p12),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: colors.error,
                    ),
                    child: const AppText(text: 'ANNULER'),
                    onPressed: () {},
                  ),
                  const VerticalSpacingWidget(Sizes.p8),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: colors.warning,
                    ),
                    child: const AppText(text: 'PAIEMENT S.REÇU '),
                    onPressed: () {},
                  ),
                  const VerticalSpacingWidget(Sizes.p8),
                  Expanded(
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                          backgroundColor: colors.success,
                          shape: RoundedRectangleBorder(
                            borderRadius: Sizes.defaultBorderRadius,
                          )),
                      child: const AppText(text: 'PAIEMENT'),
                      onPressed: () {},
                    ),
                  ),
                ],
              )),
            ],
          ),
        )
      ],
    );
  }
}

class _EspecesBody extends StatelessWidget {
  const _EspecesBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppText(text: 'Total:    144.50 DH'),
        const VerticalSpacingWidget(Sizes.p32),
        const Icon(
          Icons.chrome_reader_mode_outlined,
          size: 60,
        ),
        const VerticalSpacingWidget(Sizes.p32),
        const AppText(
          text:
              'Ecrivez le meme prix total sur la machine TPE et confirmez paiement',
        ),
        const VerticalSpacingWidget(Sizes.p16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: context.appColors.success,
              ),
              onPressed: () {},
              child: const AppText(text: 'CONFIRMER'),
            ),
            const HorizontalSpacingWidget(Sizes.p16),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: context.appColors.error,
              ),
              onPressed: () => context.pop(),
              child: const AppText(text: 'ANNULLER'),
            ),
          ],
        )
      ],
    );
  }
}

class _DialogBody extends StatelessWidget {
  const _DialogBody({
    required this.isTPE,
  });
  final bool isTPE;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.p12),
      child: isTPE ? const _TPEBody() : const _EspecesBody(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/num_extension.dart';
import 'package:my_market/core/widgets/shared/app_body_header.dart';
import 'package:my_market/core/widgets/shared/app_primary_card.dart';
import 'package:my_market/core/widgets/shared/app_tabled_card.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';

class AppMainTabledBody<T> extends StatelessWidget {
  const AppMainTabledBody({
    super.key,
    required this.title,
    required this.primaryCards,
    required this.table,
  });
  final String title;
  final List<AppPrimaryCard> primaryCards;
  final AppTabledCard<T> table;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Sizes.defaultBodyPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBodyHeader(title: title),
          const VerticalSpacingWidget(Sizes.p24),
          Row(
            children: primaryCards.indexed
                .map((e) => Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(
                          right: e.$1.isLastIndex(primaryCards.length)
                              ? Sizes.p12
                              : 0),
                      child: e.$2,
                    )))
                .toList(),
          ),
          const VerticalSpacingWidget(Sizes.p16),
          Expanded(child: table),
        ],
      ),
    );
  }
}

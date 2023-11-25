import 'package:flutter/material.dart';
import 'package:my_market/core/extensions/textstyle_extension.dart';
import 'package:my_market/core/widgets/reusables/app_bordered_circle.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

// TODO: Implementation check, pass only itemsCount if enough...

class AppTwoDimensionScrollableTable<T> extends StatefulWidget {
  const AppTwoDimensionScrollableTable({
    super.key,
    required this.items,
    required this.headers,
    required this.cellValues,
    required this.rowSelectionId,
    required this.onSelect,
    required this.onSelectAll,
    required this.selectedRows,
    this.pinnedColumnCount,
    this.pinnedRowCount,
    this.headerBackground,
  });

  final List<T> items;
  final List<String> headers;
  final List<String> Function(int index) cellValues;
  final int? pinnedColumnCount;
  final int? pinnedRowCount;
  final List<String> selectedRows;
  final String Function(int index) rowSelectionId;
  final ValueChanged<String> onSelect;
  final VoidCallback onSelectAll;
  final Color? headerBackground;
  @override
  State<AppTwoDimensionScrollableTable> createState() =>
      _AppTwoDimensionScrollableTableState();
}

class _AppTwoDimensionScrollableTableState
    extends State<AppTwoDimensionScrollableTable> {
  late ScrollController verticalController;

  @override
  void initState() {
    super.initState();
    verticalController = ScrollController();
  }

  @override
  void dispose() {
    verticalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TableView.builder(
      pinnedColumnCount: widget.pinnedColumnCount ?? 1,
      pinnedRowCount: widget.pinnedRowCount ?? 1,
      verticalDetails:
          ScrollableDetails.vertical(controller: verticalController),
      columnCount: widget.headers.length,
      columnBuilder: columnBuilder,
      rowCount: widget.items.length + 1,
      rowBuilder: rowBuilder,
      cellBuilder: cellBuilder,
    );
  }

  Widget? cellBuilder(BuildContext context, TableVicinity vicinity) {
    final rowIndex = vicinity.row;
    final columnIndex = vicinity.column;
    // Build the Special First Column
    if (columnIndex == 0 && rowIndex == 0) {
      return _RowSelector(
          selectedRows: widget.selectedRows,
          rowId: 'all',
          onSelect: (val) {
            widget.onSelectAll();
          });
    }
    if (columnIndex == 0 && rowIndex != 0) {
      final rowId = widget.rowSelectionId(rowIndex - 1);
      return _RowSelector(
        selectedRows: widget.selectedRows,
        rowId: rowId,
        onSelect: widget.onSelect,
      );
    }
    // Build The Header Row
    if (columnIndex != 0 && rowIndex == 0) {
      return Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppText(
            text: widget.headers[columnIndex],
            style: const TextStyle().bold,
          ),
          const RotatedBox(
            quarterTurns: 3,
            child: Icon(
              Icons.compare_arrows_sharp,
              size: 15,
            ),
          )
        ],
      ));
    }
    return Center(
      child: AppText(text: widget.cellValues(rowIndex - 1)[columnIndex - 1]),
    );
  }

  TableSpan rowBuilder(int index) {
    return TableSpan(
        backgroundDecoration: TableSpanDecoration(
            color: index == 0 ? widget.headerBackground ?? Colors.grey : null,
            border: const TableSpanBorder(
                trailing: BorderSide(color: Colors.black))),
        extent: const FixedTableSpanExtent(50),
        padding: TableSpanPadding(trailing: index == 0 ? 0 : 15));
  }

  TableSpan columnBuilder(int index) {
    return index == 0
        ? const TableSpan(
            extent: FixedTableSpanExtent(50),
          )
        : const TableSpan(
            extent: FixedTableSpanExtent(200),
          );
  }
}

class _RowSelector extends StatelessWidget {
  const _RowSelector({
    required this.selectedRows,
    required this.rowId,
    required this.onSelect,
  });

  final List<String> selectedRows;
  final String rowId;
  final ValueChanged<String> onSelect;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: AppBorderedCircle(
        radius: 5,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: CircleAvatar(
            backgroundColor: !selectedRows.contains(rowId)
                ? Colors.transparent
                : Colors.black87,
            child: InkResponse(
              radius: 10,
              onTap: () => onSelect(rowId),
            ),
          ),
        ),
      ),
    );
  }
}

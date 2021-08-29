import 'package:bike_store_admin_flutter/data/models/common/page_info.dart';
import 'package:flutter/material.dart';

const _range = 5;

typedef OnPageChanged = Function(int page);

class Pagination extends StatelessWidget {
  final PageInfo? pageInfo;
  final OnPageChanged onPageChanged;

  Pagination({
    required this.pageInfo,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    var minPage = pageInfo!.page! - _range;
    if (minPage < 0) {
      minPage = 0;
    }

    var maxPage = pageInfo!.page! + _range;
    if (maxPage >= pageInfo!.totalPages!) {
      maxPage = pageInfo!.totalPages! - 1;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: pageInfo!.isFirst
              ? null
              : () {
                onPageChanged(pageInfo!.page! - 1);
              },
        ),
        ...List.generate(maxPage - minPage + 1, (index) {
          final page = minPage + index;
          return Container(
            child: IconButton(
              icon: Text((page + 1).toString()),
              onPressed: page == pageInfo!.page
                  ? null
                  : () {
                    onPageChanged(page);
                  }
            )
          );
        }),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          onPressed: pageInfo!.isLast
              ? null
              : () {
                onPageChanged(pageInfo!.page! + 1);
              },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SwipAction extends StatelessWidget {
  const SwipAction(
      {Key? key,
      required this.index,
      this.rightAction,
      required this.child,
      required this.groupTag})
      : super(key: key);
  final int index;
  final List<Widget>? rightAction;
  final Widget child;
  final String groupTag;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Slidable(
          groupTag: groupTag,
          key: ValueKey(index),
          endActionPane: ActionPane(
            extentRatio: 0.4,
            motion: const ScrollMotion(),
            children: rightAction ?? [],
          ),
          child: child),
    );
  }
}

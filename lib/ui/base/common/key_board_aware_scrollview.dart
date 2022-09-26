import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class KeyboardAwareScrollView extends StatelessWidget {
  const KeyboardAwareScrollView({
    Key? key,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.padding,
    bool? primary,
    this.physics,
    this.controller,
    this.child,
    this.dragStartBehavior = DragStartBehavior.start,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
  })  : assert(
          !(controller != null && primary == true),
          'Primary ScrollViews obtain their ScrollController via inheritance from a PrimaryScrollController widget. '
          'You cannot both set primary to true and pass an explicit controller.',
        ),
        primary = primary ??
            controller == null && identical(scrollDirection, Axis.vertical),
        super(key: key);

  final Axis scrollDirection;

  final bool reverse;

  final EdgeInsetsGeometry? padding;

  final ScrollController? controller;

  final bool primary;

  final ScrollPhysics? physics;

  final Widget? child;

  final DragStartBehavior dragStartBehavior;

  final Clip clipBehavior;

  final String? restorationId;

  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
            scrollDirection: scrollDirection,
            reverse: reverse,
            padding: padding,
            primary: primary,
            physics: physics,
            controller: controller,
            child: child),
      ),
    );
  }
}

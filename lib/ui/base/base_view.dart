import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/ui/base/base_view_model.dart';

abstract class BaseView<T extends BaseViewModel> extends HookConsumerWidget {
  const BaseView({Key? key}) : super(key: key);
}

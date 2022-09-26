import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const int totalImage = 11;
const int timeDelay = 500;

class LoadingAuthView extends HookConsumerWidget {
  const LoadingAuthView(
      {required this.width,
      required this.height,
      this.onLoadingFinish,
      Key? key})
      : super(key: key);
  final double width;
  final double height;
  final VoidCallback? onLoadingFinish;

  List<String> getImagesUriLoading() {
    List<String> list = [];
    for (int i = 0; i < totalImage; i++) {
      list.add('assets/icons/login/loading_${i + 1}.png');
    }
    return list;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentImage = useState(1);
    final List<String> imagesUri = getImagesUriLoading();
    useEffect(() {
      Timer timer = Timer.periodic(const Duration(milliseconds: timeDelay),
          (Timer timer) {
        currentImage.value++;
        if (currentImage.value == totalImage) {
          onLoadingFinish?.call();
          timer.cancel();
        }
      });
      return () => {timer.cancel()};
    }, []);
    return Stack(
      children: imagesUri
          .asMap()
          .map((index, uri) => MapEntry(
              index,
              Visibility(
                visible: currentImage.value >= index,
                child: Image.asset(
                  uri,
                  width: width,
                  height: height,
                ),
              )))
          .values
          .toList(),
    );
  }
}

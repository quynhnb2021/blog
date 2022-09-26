import 'dart:io';

import 'package:blog/ui/base/common/network_image.dart';
import 'package:blog/ui/base/hook/use_router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blog/ui/themes/custom_container.dart';

class CustomCircleAvatar extends HookConsumerWidget {
  const CustomCircleAvatar({
    Key? key,
    required this.onTap,
    this.fileImage,
    this.urlImage,
  }) : super(key: key);
  final Function(int i) onTap;
  final File? fileImage;
  final String? urlImage;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    return GestureDetector(
      onTap: () {
        // showModalBottomSheet<void>(
        //   context: context,
        //   backgroundColor: Colors.transparent,
        //   builder: (BuildContext context) {
        //     return BottomPickImage(
        //         onTakePhoto: () {},
        //         onPickFromGallery: () {},
        //         onPicPhoto: (i) {
        //           router.pop();
        //           onTap(i);
        //         });
        //   },
        // );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(48),
            child: fileImage != null
                ? SizedBox(
                    width: 96,
                    height: 96,
                    child: CircleAvatar(
                      child: Image.file(
                        fileImage!,
                        fit: BoxFit.cover,
                        width: 96,
                        height: 96,
                      ),
                    ),
                  )
                : CustomNetworkImage(
                    image: urlImage ??
                        "https://upload.wikimedia.org/wikipedia/commons/1/1e/Default-avatar.jpg?20160314221008",
                    width: 96,
                    height: 96,
                  ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CustomContainer(
              color: const Color(0xFFD9D9D9),
              padding: const EdgeInsets.all(8),
              width: 24,
              height: 24,
              radius: 12,
              child: Icon(
                color: Theme.of(context).primaryColor,
                Icons.camera_alt,
                size: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

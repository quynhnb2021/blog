import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? image;
  final double? width;
  final double? height;
  const CustomNetworkImage({this.width, this.height, this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return image == null
        ? Container(
            width: width,
            height: height,
            child: Center(
              child: SizedBox(
                width: 16,
                height: 16,
                child: const CircularProgressIndicator(),
              ),
            ))
        : CachedNetworkImage(
            placeholder: (context, url) => Container(
                width: width,
                height: height,
                child: const SizedBox(
                  width: 16,
                  height: 16,
                  child: const CircularProgressIndicator(),
                )),
            errorWidget: (context, url, error) => CachedNetworkImage(
              imageUrl:
                  'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/03_2019/nhung-bai-bien-dep-nhat-viet-nam-2.jpg',
              fit: BoxFit.fill,
            ),
            imageUrl: image!,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          );
  }
}

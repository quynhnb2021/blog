import 'package:flutter/material.dart';

enum TabType { blog, createblog, setting }

Widget mapTabTypeToIconUri(TabType type) {
  switch (type) {
    case TabType.blog:
      return const Icon(Icons.home);
    case TabType.createblog:
      return const Icon(Icons.newspaper);

    case TabType.setting:
      return const Icon(Icons.settings);
  }
}

String mapTabTypeToLabel(TabType type) {
  switch (type) {
    case TabType.createblog:
      return 'Create Blog';
    case TabType.blog:
      return 'Blog';
    case TabType.setting:
      return 'Setting';
  }
}

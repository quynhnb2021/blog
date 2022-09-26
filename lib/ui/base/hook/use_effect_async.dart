import 'package:flutter_hooks/flutter_hooks.dart';

void useEffectAsync(Future<void> Function() task) {
  useEffect(() {
    Future.microtask(task);
    return null;
  }, []);
}
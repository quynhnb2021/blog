import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class SCleanListViewDelegate<T> {
  Future<List<T>> fetchData(int page);
}

class SCleanListView<T> extends HookConsumerWidget {
  final Widget loadMoreWidget;
  final Widget Function(int) itemWidget;
  final int startPage;
  final int limit;
  final Future<List<T>> Function(int) fetchData;

  const SCleanListView({
    super.key,
    this.loadMoreWidget = const CircularProgressIndicator(),
    required this.itemWidget,
    required this.fetchData,
    this.startPage = -1,
    this.limit = 20,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = useScrollController();
    final data = useState(<T>[]);
    final isLoadMore = useState(false);
    final currentPage = useState(startPage);
    useEffect(() {
      fetchData(currentPage.value).then((newData) {
        data.value.addAll(newData);
        isLoadMore.value = data.value.length > limit ? true : false;
      });

      scrollController.addListener(() async {
        if (currentPage.value == -1 || data.value.length < limit) return;
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          currentPage.value = currentPage.value + 1;
          isLoadMore.value = true;
          List<T> ls = await fetchData(currentPage.value);
          if (ls.isEmpty) {
            isLoadMore.value = false;
          } else {
            List<T> dsList = [];
            dsList.addAll(data.value);
            dsList.addAll(ls);
            data.value = dsList;
          }
        }
      });
      return null;
    }, []);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          currentPage.value = startPage;
          List<T> dsList = [];
          dsList.addAll(await fetchData(currentPage.value));
          data.value = dsList;
          return;
        },
        child: ListView.builder(
            shrinkWrap: false,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            controller: scrollController,
            itemBuilder: (context, index) {
              if (index == data.value.length) {
                return Container(
                  margin: const EdgeInsets.all(15),
                  alignment: Alignment.center,
                  child: isLoadMore.value
                      ? loadMoreWidget
                      : const SizedBox(
                          height: 40,
                        ),
                );
              }
              return itemWidget(index);
            },
            itemCount: data.value.length + 1),
      ),
    );
  }
}

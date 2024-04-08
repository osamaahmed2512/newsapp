import 'package:flutter/material.dart';
import 'package:news_app/widgets/categories_list_view.dart';
import '../widgets/news_list_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Service',
              style: TextStyle(color: Colors.orange),
            ),
          ],
        ),
      ),
      body: ScrollView(),
    );
  }
}

class ScrollView extends StatelessWidget {
  const ScrollView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: CategoriesListView()),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 32,
            ),
          ),
          NewListViewBuilder(category: "general"),
          //  const SliverToBoxAdapter(
          //   child: NewsListView(),
          // )
        ],
      ),

      // child: Column(
      //   children: [
      //     CategoriesListView(),
      //     SizedBox(
      //       height: 32,
      //     ),
      //     Expanded(
      //       child: NewsListView(),
      //     ),
      //   ],
      // ),
    );
  }
}

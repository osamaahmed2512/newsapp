// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:news_app/models/article_model.dart';
// import 'package:news_app/services/news_service.dart';

// import 'news_tile.dart';

// class NewsListView extends StatefulWidget {
//   const NewsListView({
//     super.key,
//   });

//   @override
//   State<NewsListView> createState() => _NewsListViewState();
// }

// class _NewsListViewState extends State<NewsListView> {
//   List<ArticleModel> articles = [];

//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     GetGeneralNews();
//   }

//   Future<void> GetGeneralNews() async {
//     articles = await news_service(Dio()).getnews();
//     isLoading = false;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isLoading ? SliverToBoxAdapter(child: Center(child: CircularProgressIndicator())) :
//         // ListView.builder(
//         //     shrinkWrap: true,
//         //     physics: const NeverScrollableScrollPhysics(),
//         //     itemCount: 10,
//         //     itemBuilder: (context, index) {
//         //       return const Padding(
//         //         padding: EdgeInsets.only(bottom: 16),
//         //         child: Newstile(),
//         //       );
//         //     })
//         SliverList(
//       delegate: SliverChildBuilderDelegate(
//           childCount: articles.length,
//           (context, index) => Padding(
//                 padding: const EdgeInsets.only(bottom: 16),
//                 child: Newstile(
//                   article_model: articles[index],
//                 ),
//               )),
//     );
//   }
// }

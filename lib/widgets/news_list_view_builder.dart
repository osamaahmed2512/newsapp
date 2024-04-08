import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

// import '../models/article_model.dart';
import '../services/news_service.dart';
import 'error_message.dart';
import 'news_list_view.dart';

class NewListViewBuilder extends StatefulWidget {
  final String category;
  const NewListViewBuilder({super.key, required this.category});

  @override
  State<NewListViewBuilder> createState() => _NewListViewBuilderState();
}

class _NewListViewBuilderState extends State<NewListViewBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewService( Dio() ).getnews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(
            articles: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter(
            child: Center(
              child: ErrorMessage(),
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
    //  List<ArticleModel> articles = [];
    // bool isLoading = true;

    // @override
    // void initState() {
    //   super.initState();
    //   GetGeneralNews();
    // }

    // Future<void> GetGeneralNews() async {
    //   articles = await NewService(Dio()).getnews();
    //   isLoading = false;
    //   setState(() {});
    // }

    // return isLoading
    //     ? SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()))
    //     : articles.isNotEmpty
    //         ? NewsListView(
    //             articles: articles,
    //           )
    //         : SliverToBoxAdapter(
    //             child: Center(child: Text('soory there was an error it might be resolved soon ')),
    //           );
  }
}

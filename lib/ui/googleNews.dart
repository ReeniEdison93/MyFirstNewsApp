import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/bloc/article_bloc.dart';
import 'package:sample_app/data/repo/article_repo.dart';
import 'package:sample_app/ui/newsPage.dart';

class GoogleNews extends StatefulWidget {
  @override
  _GoogleNewsState createState() => _GoogleNewsState();
}

class _GoogleNewsState extends State<GoogleNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        builder: (context)=> ArticleBloc(repository: ArticleRepositoryImpl()),
        child: NewsPage(),
      ),
    );
  }


}


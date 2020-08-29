import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/article_state.dart';
import 'package:sample_app/bloc/article_bloc.dart';
import 'package:sample_app/data/models/article.dart';
import 'package:sample_app/events/artticle_event.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  ArticleBloc articleBloc;

  @override
  void initState() {
    super.initState();
    articleBloc = BlocProvider.of<ArticleBloc>(context);
    articleBloc.add(FetchArticleEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          return Material(
            child: Scaffold(
              appBar: AppBar(
                title: Text('News'),
                backgroundColor: Colors.yellow,
              ),
              body: Container(
                child: BlocListener<ArticleBloc,ArticleState>(
                  listener: (context,state){
                    if(state is ArticleErrorState)
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(state.message),
                      ));
                  },
                  child: BlocBuilder<ArticleBloc,ArticleState>(
                    builder: (context,state){
                      if(state is ArticleInitialState){
                          return loadingNews();}
                      else if(state is ArticleLoadingState){
                          return loadingNews();}
                      else if (state is ArticleLoadedState){
                          return newsList(state.articles);}
                      else if( state is ArticleErrorState){
                        return errorLoadingNews(state.message);
                    }
                      else
                        return SnackBar(
                        backgroundColor: Colors.red,
                          content: Text('Oops Something went wrong'),
                        );
                      },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget loadingNews() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget errorLoadingNews(String message){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(message),
      ),
    );
  }

  Widget newsList(List<Articles> articles){
    return ListView.builder(
      itemCount: articles.length,
        itemBuilder: (ctx,pos){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: ListTile(
              leading: ClipRect(
                child: Hero(
                  tag: articles[pos].title,
                  child: articles[pos].urlToImage != null ? Image.network(articles[pos].urlToImage,
                  fit: BoxFit.cover,
                  height: 70,
                  width: 70,): Container(),
                ),
              ),
              title: Text(articles[pos].title),
              subtitle: Text(articles[pos].publishedAt),
            ),
          ),
        );
        });
  }
}

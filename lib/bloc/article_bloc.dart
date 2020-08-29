import 'package:bloc/bloc.dart';
import 'package:sample_app/article_state.dart';
import 'package:sample_app/data/models/article.dart';
import 'package:sample_app/data/repo/article_repo.dart';
import 'package:sample_app/events/artticle_event.dart';
import 'package:meta/meta.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleRepository repository;
  ArticleBloc({@required this.repository});

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
   if(event is FetchArticleEvent){
     yield ArticleLoadingState();
     try{
     List<Articles> articles = await repository.getArticles();
     yield ArticleLoadedState(articles:articles);}
     catch(e){
       yield ArticleErrorState(message: e.toString());
    }
   }
  }

  @override
  ArticleState get initialState => ArticleInitialState();
}
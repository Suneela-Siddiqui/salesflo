import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesflo_project/posts_cubit/model/entity.dart';
import 'package:salesflo_project/posts_cubit/network/data_service.dart';

class PostsCubit extends Cubit<List<Post>> {
  final _dataService = DataService();

  PostsCubit() : super([]);

  void getPosts() async => emit(await _dataService.getPosts());
}
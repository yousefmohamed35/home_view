import 'package:bloc/bloc.dart';
import 'package:homeview/home/data/models/home_model.dart';
import 'package:meta/meta.dart';

part 'home_view_state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  HomeViewCubit() : super(HomeViewInitial());
}

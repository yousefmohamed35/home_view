import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeview/home/data/models/home_model/job_added_model.dart';

part 'added_job_state.dart';

class Addedjobcubit extends Cubit<AddedjobState> {
  Addedjobcubit() : super(AddedjobcubitInitial());
}

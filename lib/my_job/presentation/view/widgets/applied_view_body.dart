import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeview/my_job/presentation/manager/my_job_cubit.dart';
import 'package:homeview/my_job/presentation/manager/my_job_state.dart';
import 'package:homeview/my_job/presentation/view/no_saved_view.dart';

import 'applied_job_item.dart';

class AppliedViewBody extends StatelessWidget {
  const AppliedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyJobCubit, MyJobState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is MyJobSuccess) {
          if (state.jobs.isNotEmpty) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: List.generate(state.jobs.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: AppliedJobItem(),
                    );
                  }),
                ),
              ),
            );
          } else {
            return NoSavedView();
          }
        } else if (state is MyJobFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

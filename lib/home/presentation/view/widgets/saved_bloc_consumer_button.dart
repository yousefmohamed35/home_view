import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/added_job_cubit.dart';
import 'custom_button.dart';

class SavedBlocConsumerButton extends StatelessWidget {
  const SavedBlocConsumerButton({super.key, required this.jobId});

  final String jobId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Addedjobcubit, AddedjobState>(
      listener: (context, state) {
        if (state is AddedjobcubitSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.jobAddedModel.message!)));
        }
        if (state is AddedjobcubitFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Job is already saved')));
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: 'Save',
          isIcon: true,
          onTap: () {
            BlocProvider.of<Addedjobcubit>(context).savedJob(
              jobId: jobId,
              memberId: 'de8e0174-afdd-4079-8560-9069635d13b9',
            );
          },
        );
      },
    );
  }
}

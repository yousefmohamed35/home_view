import 'package:flutter/material.dart';
import 'package:homeview/core/app_colors.dart';
import 'package:homeview/home/presentation/view/widgets/apply_now_botton.dart';
import 'package:homeview/home/presentation/view/widgets/call_center.dart';
import 'package:homeview/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:homeview/home/presentation/view/widgets/job_description_card.dart';
import 'package:homeview/home/presentation/view/widgets/job_infosection.dart';
import 'package:homeview/home/presentation/view/widgets/rating_cards.dart';
import 'package:homeview/home/presentation/view/widgets/requirements_card.dart';
import 'package:homeview/home/presentation/view/widgets/review_header.dart';
import 'package:homeview/home/presentation/view/widgets/status_row.dart';
import 'widgets/hiring_team_card.dart';

class JobDescriptionView extends StatelessWidget {
  const JobDescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: CustomAppBar(
        onClose: () {
          Navigator.pop(context);
        },
        onMorePressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            CallCenterWidget(),
            SizedBox(height: 8),
            StatusRowWidget(),
            SizedBox(height: 8),
            JobDescriptionCard(),
            SizedBox(height: 24),
            RequirementsCard(),
            SizedBox(height: 24),
            ReviewsHeader(onViewAllPressed: () {}),
            RatingCards(),
            SizedBox(height: 24),
            HiringTeamCard(),
            SizedBox(height: 24),
            JobInfoSection(onLearnMore: () {}, onReportJob: () {}),
            ApplyNowButton(),
          ],
        ),
      ),
    );
  }
}

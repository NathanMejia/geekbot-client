part of'details_view.dart';


class ContentSection extends StatelessWidget {
  const ContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailsState>(
      builder: (context, state) {

        if (state is DetailLoadingState){
          return const Expanded(child: Center(child: CircularProgressIndicator()),);
        }

        final standUpReports = BlocProvider.of<DetailsBloc>(context).currentReportStandup;
        return Expanded(
          child: ListView.builder(
            itemCount: standUpReports.length,
            itemBuilder: (context, index) {
              final standUpLoop = standUpReports[index];
              return QuestionDataWidget(standUpReport: standUpLoop,);
            },
          )
        );
      },
    );
  }
}

class QuestionDataWidget extends StatelessWidget {
  const QuestionDataWidget({
    super.key, required this.standUpReport,
  });

  final ReportStandupModel standUpReport;

  @override
  Widget build(BuildContext context) {
    final questions = standUpReport.questions;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(standUpReport.id.toString()),
                const SizedBox(width: 16,),
                Text(DateTime.fromMillisecondsSinceEpoch(standUpReport.timeStamp * 1000).toString()),
              ],
            ),

            ...List.generate(
              questions.length, 
              (index) => _QuestionZone(surveyQuestionModel: questions[index])
            )

          ],
        ),
      ),
    );
  }
}

class _QuestionZone extends StatelessWidget {
  const _QuestionZone({
    required this.surveyQuestionModel
  });

  final SurveyQuestionModel surveyQuestionModel;
  @override
  Widget build(BuildContext context) {
    const color = Colors.white;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        color: color.withAlpha(50),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Text(surveyQuestionModel.question),
                    const Divider(),
                    Text(surveyQuestionModel.answer),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
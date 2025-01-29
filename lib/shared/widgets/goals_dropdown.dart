import 'package:flutter/material.dart';
import '../../app/theme.dart';

class GoalsInputWidget extends StatefulWidget {
  final ValueChanged<List<String>> onGoalsChanged;
  final List<String> selectedGoals;

  const GoalsInputWidget({
    Key? key,
    required this.onGoalsChanged,
    required this.selectedGoals,
  }) : super(key: key);

  @override
  _GoalsInputWidgetState createState() => _GoalsInputWidgetState();
}

class _GoalsInputWidgetState extends State<GoalsInputWidget> {
  final List<String> goals = [
    'Community Monetisation',
    'Event /webinar',
    'Course',
    'Digital product',
    'Website Api',
    'Appointment',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Goals",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: AppColors.darkTextGray,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ExpansionTile(
            title: const Text(
              "Select Goals",
              style: const TextStyle(
                color: AppColors.white,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_drop_down,
              color: AppColors.white,
            ),
            collapsedIconColor: AppColors.white,
            iconColor: AppColors.white,
            backgroundColor: AppColors.darkTextGray,
            childrenPadding:
                const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
            children: [
              for (final goal in goals)
                CheckboxListTile(
                  value: widget.selectedGoals.contains(goal),
                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        widget.selectedGoals.add(goal);
                      } else {
                        widget.selectedGoals.remove(goal);
                      }
                    });
                    widget.onGoalsChanged(widget.selectedGoals);
                  },
                  title: Text(
                    goal,
                    style: const TextStyle(
                      color: AppColors.white,
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: AppColors.signUpOrange,
                  checkColor: AppColors.darkTextGray,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

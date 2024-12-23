import 'package:flutter/material.dart';
import 'package:to_do_app/constants/defaults.dart';
import 'package:to_do_app/constants/ghaps.dart';
import 'package:to_do_app/models/task.dart';
import 'package:to_do_app/theme/app_colors.dart';
import 'package:to_do_app/theme/theme.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(task.id.toString()),
      onDismissed: (direction) {},
      background: Container(
        color: task.isCompleted == 0 ? Colors.green : Colors.amber,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Icon(task.isCompleted == 0 ? Icons.done : Icons.task,
                color: Colors.white),
            gapW8,
            Text(
              task.isCompleted == 0 ? 'Completed' : 'TODO',
              style: Themes.customStyle(
                bold: false,
                size: 14,
              ),
            ),
          ],
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(Icons.delete, color: Colors.white),
            gapW8,
            Text(
              'Delete',
              style: Themes.customStyle(
                bold: false,
                size: 14,
              ),
            ),
          ],
        ),
      ),
      child: _taskBody(),
    );
  }

  Container _taskBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppDefaults.padding16),
      margin:
          EdgeInsets.symmetric(horizontal: AppDefaults.padding16, vertical: 4),
      decoration: BoxDecoration(
          color: _getColor(task.color),
          borderRadius: BorderRadius.circular(AppDefaults.borderRadius)),
      child: Row(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gapH16,
                Text(
                  task.title!,
                  style: Themes.customStyle(bold: true),
                ),
                gapH12,
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.grey[200],
                      size: 18,
                    ),
                    gapW8,
                    Text(
                      '${task.startTime} - ${task.endTime}',
                      style: Themes.customStyle(bold: false, size: 14),
                    ),
                  ],
                ),
                gapH12,
                Text(
                  task.note!,
                  style: Themes.customStyle(bold: false, size: 16),
                ),
                gapH16,
              ],
            ),
          )),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              task.isCompleted == 0 ? 'TODO' : 'Completed',
              style: Themes.customStyle(size: 12, bold: false),
            ),
          ),
        ],
      ),
    );
  }

  _getColor(int? color) {
    switch (color) {
      case 0:
        return AppColors.bluishClr;
      case 1:
        return AppColors.pinkClr;
      case 2:
        return AppColors.orangeClr;
      default:
        return AppColors.bluishClr;
    }
  }
}

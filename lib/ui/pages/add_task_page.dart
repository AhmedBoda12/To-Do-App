import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/constants/defaults.dart';
import 'package:to_do_app/constants/ghaps.dart';
import 'package:to_do_app/controllers/task_controller.dart';
import 'package:to_do_app/theme/app_colors.dart';
import 'package:to_do_app/theme/theme.dart';
import 'package:to_do_app/ui/widgets/button.dart';
import 'package:to_do_app/ui/widgets/input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)));

  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  String _selectedRepaet = 'None';
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];
  int _selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: Get.back, icon: Icon(Icons.arrow_back_ios_new)),
        title: Text(
          'Add New Task',
          style: Themes().headingStyle,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDefaults.padding8),
            child: CircleAvatar(
              backgroundImage: AssetImage('images/person.jpeg'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppDefaults.padding8),
          child: Column(
            children: [
              InputField(
                controller: _titleController,
                hint: 'Enter title here',
                label: 'Title',
              ),
              gapH16,
              InputField(
                controller: _noteController,
                hint: 'Enter note here',
                label: 'Note',
              ),
              gapH20,
              InputField(
                hint: DateFormat.yMd().format(selectedDate),
                label: 'Date',
                widget: IconButton(
                    onPressed: () {}, icon: Icon(Icons.calendar_today)),
              ),
              gapH20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: InputField(
                      hint: startTime,
                      label: 'Start time',
                      widget: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.access_time_rounded)),
                    ),
                  ),
                  Expanded(
                    child: InputField(
                      hint: endTime,
                      label: 'End time',
                      widget: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.access_time_rounded)),
                    ),
                  ),
                ],
              ),
              gapH20,
              InputField(
                hint: '$_selectedRemind minutes early',
                label: 'Remind',
                widget: DropdownButton(
                  underline: Container(
                    height: 0,
                  ),
                  items: remindList
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            '$e',
                          )))
                      .toList(),
                  style: Themes().subTitleStyle,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedRemind = newValue!;
                    });
                  },
                ),
              ),
              gapH20,
              InputField(
                hint: _selectedRepaet,
                label: 'Repeat',
                widget: DropdownButton(
                  underline: Container(
                    height: 0,
                  ),
                  items: repeatList
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                          )))
                      .toList(),
                  style: Themes().subTitleStyle,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedRepaet = newValue!;
                    });
                  },
                ),
              ),
              gapH20,
              colorPallate(),
              gapH20,
              MyButton(
                label: 'Create Task',
                tap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  Column colorPallate() {
    return Column(
      children: [
        Text(
          'Color',
          style: Themes().titleStyle,
        ),
        gapH8,
        Wrap(
            spacing: 16,
            children: List.generate(
              3,
              (index) => InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => setState(() {
                  _selectedColor = index;
                }),
                child: CircleAvatar(
                  backgroundColor: index == 0
                      ? AppColors.bluishClr
                      : index == 1
                          ? AppColors.pinkClr
                          : AppColors.orangeClr,
                  radius: 16,
                  child: _selectedColor == index ? Icon(Icons.done) : null,
                ),
              ),
            ))
      ],
    );
  }
}

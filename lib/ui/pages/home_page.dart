import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/constants/defaults.dart';
import 'package:to_do_app/constants/ghaps.dart';
import 'package:to_do_app/services/notification_services.dart';
import 'package:to_do_app/services/theme_services.dart';
import 'package:to_do_app/theme/app_colors.dart';
import 'package:to_do_app/theme/theme.dart';
import 'package:to_do_app/ui/pages/add_task_page.dart';
import 'package:to_do_app/ui/widgets/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();

  late NotifyHelper notifyHelper;
  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initialisationNotifications();
    notifyHelper.requestAndroidPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                setState(() {
                  ThemeServices().switchTheme();
                  // notifyHelper.displayNotifications(title: 'Hello, Ahmed', body: 'New');
                  notifyHelper.scheduleNotifications();
                });
              },
              icon: Icon(Get.isDarkMode ? Icons.light_mode : Icons.dark_mode)),
          title: Text(
            'To Do App',
            style: Themes().headingStyle,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            gapH12,
            _taskBar(),
            gapH8,
            _datePicker(),
            gapH8,
            _tasksContainer(),
          ],
        ));
  }

  _taskBar() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: AppDefaults.padding16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(
                    DateTime.now(),
                  ),
                  style: Themes().subHeadingStyle,
                ),
                Text(
                  'Today',
                  style: Themes().headingStyle,
                )
              ],
            ),
            MyButton(
                label: '+ Add Task',
                tap: () async {
                  await Get.to(AddTaskPage());
                })
          ],
        ));
  }

  _datePicker() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppDefaults.padding16),
      child: DatePicker(
        selectedDate,
        height: 100,
        width: 80,
        initialSelectedDate: selectedDate,
        selectedTextColor: Colors.white,
        selectionColor: AppColors.primaryClr,
        dayTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
                color: Colors.black45,
                fontSize: 16,
                fontWeight: FontWeight.w600)),
        dateTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
                color: Colors.black45,
                fontSize: 20,
                fontWeight: FontWeight.w600)),
        monthTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
                color: Colors.black45,
                fontSize: 14,
                fontWeight: FontWeight.w600)),
      ),
    );
  }

  _tasksContainer() {
    return _emptyTasks();
  }

  Padding _emptyTasks() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDefaults.padding16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            gapH24,
            gapH24,
            gapH24,
            SvgPicture.asset(
              'images/task.svg',
              color: AppColors.primaryClr,
              height: 80,
            ),
            gapH16,
            Text(
              'You don\'t have any task yet! \n Add new tasks to make your day productive.',
              style: Themes().subTitleStyle,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
